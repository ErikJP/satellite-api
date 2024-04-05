defmodule SatelliteApi.Scheduler do
  @moduledoc """
  Scheduler for pulling / loading data from Space Track API
  """
  root = File.cwd!
  space_track_config_file = "#{root}/config/space_track.exs"
  parsed_result = Config.Reader.read!(space_track_config_file)
  @uri_base "https://www.space-track.org"
  @request_login "/ajaxauth/login"
  @request_cmd_action "/basicspacedata/query"
  @username parsed_result[:space_track][:username]
  @password parsed_result[:space_track][:password]
  use GenServer

  @impl true
  def start_link(_) do
    GenServer.start_link(__MODULE__, %{})
  end

  @impl true
  def init(state) do
    # Check if current time is top or bottom of the hour, if so then sleep until it is not
    # (Space Track API docs suggest not querying at top or bottom of the hour for TLEs)
    time_now = DateTime.utc_now()
    minute = time_now.minute
    if minute >=58 or minute <=1 do  # inclue 58th minute in case it is very close to 59th minute; this accounts for process time
      sleep_time = 3 * 60 * 1000  # 3 minutes gets us well outside of top or bottom of the hour
      Process.sleep(sleep_time)
    end
    # Set up an hourly interval (60 minutes * 60 seconds * 1000 milliseconds = hour_in_milliseconds)
    interval = 60 * 60 * 1000
    :timer.send_interval(interval, :work)
    satellite_norad_ids = ["41838", "37951"]
    Enum.map(
      satellite_norad_ids,
      fn id ->
        HTTPoison.post(
          "http://localhost:4000/api/satellites",
          "{\"satellite\": {\"norad_cat_id\": \"#{id}\"}}",
          [{"Content-Type", "application/json"}]
        )
      end
    )
    handle_info(:work, state)
    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    IO.inspect(DateTime.utc_now())
    {:ok, body} = fetch_space_track_data()
    load_space_track_data(body)
    {:noreply, state}
  end

  defp fetch_space_track_data() do
    IO.puts("##### ###### FETCHING ##### #####")
    # TODO: add something here to grab the NORAD_CAT_IDs dynamically from database (`satellites` table)
    query = "/class/gp/NORAD_CAT_ID/41838,37951/orderby/NORAD_CAT_ID%20asc/limit/5/metadata/true/emptyresult/show"
    case HTTPoison.post(
      "#{@uri_base}#{@request_login}",
      "{\"identity\": \"#{@username}\", \"password\": \"#{@password}\", \"query\": \"#{@uri_base}#{@request_cmd_action}#{query}\"}",
      [{"Content-Type", "application/json"}]
    ) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts(body)
        {:ok, body}
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts("Not found :(")
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect(reason)
    end
  end

  defp load_space_track_data(body) do
    {:ok, decoded} = Poison.decode(body)
    {:ok, data} = Map.fetch(decoded, "data")
    IO.inspect(data)
    for map <- data do
      IO.inspect(map)
      {:ok, query} = format_tle_map_to_json(map)
      IO.puts("##### QUERY #####")
      IO.puts(query)
      # TODO: replace url with constants
      # HTTPoison.post(
      #   "http://localhost:4000/api/tles",
      #   "{\"tle\": {\"tle_line0\": \"TEST\", \"eccentricity\": \"TEST\", \"time_system\": \"TEST\", \"comment\": \"TEST\", \"periapsis\": \"TEST\", \"ra_of_asc_node\": \"TEST\", \"site\": \"TEST\", \"rev_at_epoch\": \"TEST\", \"rcs_size\": \"TEST\", \"epoch\": \"TEST\", \"ephemeris_type\": \"TEST\", \"arg_of_pericenter\": \"TEST\", \"mean_element_theory\": \"TEST\", \"bstar\": \"TEST\", \"tle_line2\": \"TEST\", \"apoapsis\": \"TEST\", \"mean_anomaly\": \"TEST\", \"ccsds_omm_vers\": \"TEST\", \"object_name\": \"TEST\", \"period\": \"TEST\", \"tle_line1\": \"TEST\", \"inclination\": \"TEST\", \"decay_date\": \"TEST\", \"object_type\": \"TEST\", \"center_name\": \"TEST\", \"originator\": \"TEST\", \"launch_date\": \"TEST\", \"ref_frame\": \"TEST\", \"mean_motion_ddot\": \"TEST\", \"object_id\": \"TEST\", \"country_code\": \"TEST\", \"creation_date\": \"TEST\", \"classification_type\": \"TEST\", \"mean_motion\": \"TEST\", \"file\": \"TEST\", \"element_set_no\": \"TEST\", \"norad_cat_id\": \"41838\", \"mean_motion_dot\": \"TEST\", \"semimajor_axis\": \"TEST\", \"gp_id\": \"TEST\"}}",
      #   [{"Content-Type", "application/json"}]
      # )
      HTTPoison.post("http://localhost:4000/api/tles", query, [{"Content-Type", "application/json"}])
      IO.puts("\n\n\n##################################\n\n\n")
    end
  end

  defp format_tle_map_to_json(map) do
    query = for {key, val} <- map, reduce: "{\"tle\": {" do
      acc -> "#{acc}\"#{String.downcase(key)}\": \"#{val}\", "
    end
    {:ok, "#{String.trim(query, ", ")}}}"}
  end
end


# {"tle": {"tle_line2": "2 37951   6.6946  86.1331 0003089 303.4584 266.8419  1.00271734 44994", "apoapsis": "35799.636", "rcs_size": "LARGE", "tle_line0": "0 LUCH 5A", "country_code": "CIS", "site": "TTMTR", "decay_date": "", "semimajor_axis": "42164.746", "element_set_no": "999", "time_system": "UTC", "tle_line1": "1 37951U 11074B   24095.82205744 -.00000051  00000-0  00000-0 0  9997", "object_type": "PAYLOAD", "originator": "18 SPCS", "ref_frame": "TEME", "mean_element_theory": "SGP4", "mean_motion_dot": "-0.00000051", "file": "4263706", "inclination": "6.6946", "ephemeris_type": "0", "object_name": "LUCH 5A", "gp_id": "253694379", "mean_anomaly": "266.8419", "creation_date": "2024-04-05T02:54:34", "rev_at_epoch": "4499", "ccsds_omm_vers": "3.0", "ra_of_asc_node": "86.1331", "bstar": "0.00000000000000", "comment": "GENERATED VIA SPACE-TRACK.ORG API", "eccentricity": "0.00030890", "classification_type": "U", "launch_date": "2011-12-11", "center_name": "EARTH", "mean_motion": "1.00271734", "epoch": "2024-04-04T19:43:45.762816", "norad_cat_id": "37951", "arg_of_pericenter": "303.4584", "mean_motion_ddot": "0.0000000000000", "period": "1436.098", "object_id": "2011-074B", "periapsis": "35773.587"}}
# 40



# %{"tle" => %{"object_type" => "", "mean_anomaly" => "", "period" => "", "mean_motion" => "", "inclination" => "", "center_name" => "", "mean_motion_ddot" => "", "epoch" => "", "arg_of_pericenter" => "", "tle_line0" => "", "object_id" => "", "ccsds_omm_vers" => "", "time_system" => "", "launch_date" => "", "tle_line2" => "", "mean_element_theory" => "", "site" => "", "classification_type" => "", "comment" => "", "ra_of_asc_node" => "", "country_code" => "", "decay_date" => "", "apoapsis" => "", "file" => "", "object_name" => "", "tle_line1" => "", "gp_id" => "", "creation_date" => "", "ref_frame" => "", "periapsis" => "", "semimajor_axis" => "", "bstar" => "", "originator" => "", "ephemeris_type" => "", "element_set_no" => "", "rcs_size" => "", "rev_at_epoch" => "", "mean_motion_dot" => "", "norad_cat_id" => "", "eccentricity" => ""}}
# %{"tle" => %{"object_type" => "", "mean_anomaly" => "", "period" => "", "mean_motion" => "", "inclination" => "", "center_name" => "", "mean_motion_ddot" => "", "epoch" => "", "arg_of_pericenter" => "", "tle_line0" => "", "object_id" => "", "ccsds_omm_vers" => "", "time_system" => "", "launch_date" => "", "tle_line2" => "", "mean_element_theory" => "", "site" => "", "classification_type" => "", "comment" => "", "ra_of_asc_node" => "", "country_code" => "", "decay_date" => "", "apoapsis" => "", "file" => "", "object_name" => "", "tle_line1" => "", "gp_id" => "", "creation_date" => "", "ref_frame" => "", "periapsis" => "", "semimajor_axis" => "", "bstar" => "", "originator" => "", "ephemeris_type" => "", "element_set_no" => "", "rcs_size" => "", "rev_at_epoch" => "", "mean_motion_dot" => "", "norad_cat_id" => "", "eccentricity" => ""}}
