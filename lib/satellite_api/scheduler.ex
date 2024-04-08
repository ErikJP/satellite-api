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
  @satellite_api_uri_base "http://localhost:4000"
  @tles_api "/api/tles"
  @satellites_api "/api/satellites"
  use GenServer

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
          "#{@satellite_api_uri_base}#{@satellites_api}",
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
    satellites_str_list = get_satellites_str_list()
    query = "/class/gp/NORAD_CAT_ID/#{satellites_str_list}/orderby/NORAD_CAT_ID%20asc/limit/5/metadata/true/emptyresult/show"
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

  defp get_satellites_str_list() do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} = HTTPoison.get("#{@satellite_api_uri_base}#{@satellites_api}")
    {:ok, decoded} = Poison.decode(body)
    {:ok, data} = Map.fetch(decoded, "data")
    str_list = for map <- data, reduce: "" do
      acc -> "#{acc}#{Map.fetch(map, "norad_cat_id") |> elem(1)},"
    end
    String.trim(str_list, ",")
  end

  defp load_space_track_data(body) do
    {:ok, decoded} = Poison.decode(body)
    {:ok, data} = Map.fetch(decoded, "data")
    for map <- data do
      {:ok, query} = format_tle_map_to_json(map)
      HTTPoison.post("#{@satellite_api_uri_base}#{@tles_api}", query, [{"Content-Type", "application/json"}])
    end
  end

  defp format_tle_map_to_json(map) do
    query = for {key, val} <- map, reduce: "{\"tle\": {" do
      acc -> "#{acc}\"#{String.downcase(key)}\": \"#{val}\", "
    end
    {:ok, "#{String.trim(query, ", ")}}}"}
  end
end
