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
    fetch_space_track_data()
    # Set up an hourly interval (60 minutes * 60 seconds * 1000 milliseconds = hour_in_milliseconds)
    interval = 60_000  # 60 * 60 * 1000
    :timer.send_interval(interval, :work)
    {:ok, state}
  end

  @impl true
  def handle_info(:work, state) do
    IO.puts("##### ###### HELLO ##### #####")
    fetch_space_track_data()
    # {:ok, body} = fetch_space_track_data()
    # load_space_track_data(body)
    {:noreply, state}
  end

  defp fetch_space_track_data() do
    IO.puts("##### ###### FETCHING ##### #####")
    # TODO: add something here to grab the NORAD_CAT_IDs dynamically from database (`satellites` table)
    # query = "/class/gp/NORAD_CAT_ID/41838,37951/orderby/NORAD_CAT_ID%20asc/limit/5/metadata/true/emptyresult/show"
    # case HTTPoison.post(
    #   "#{@uri_base}#{@request_login}",
    #   "{\"identity\": \"#{@username}\", \"password\": \"#{@password}\", \"query\": \"#{@uri_base}#{@request_cmd_action}#{query}\"}",
    #   [{"Content-Type", "application/json"}]
    # ) do
    #   {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    #     IO.puts(body)
    #     {:ok, body}
    #   {:ok, %HTTPoison.Response{status_code: 404}} ->
    #     IO.puts("Not found :(")
    #   {:error, %HTTPoison.Error{reason: reason}} ->
    #     IO.inspect(reason)
    # end
  end

  defp load_space_track_data(body) do
    {:ok, decoded} = Poison.decode(body)
    {:ok, data} = Map.fetch(decoded, "data")
    for map <- data do
      # TODO UPLOAD TO DB
    end
  end
end
