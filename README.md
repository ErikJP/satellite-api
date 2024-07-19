# SatelliteApi

## Requirements
  * Elixir 1.16.1 (compiled with Erlang/OTP 26)
  * Docker version 25.0.3, build 4debf41 (or greater; lesser may work but is untested)
    * Used for running Postgres; having Postgres installed locally is an alternative

## Starting the application (locally)
Create Docker container to run Postgres
  * `docker run --name phoenix-postgres -e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5500:5432 -d postgres`
    * Note: user and password may vary

Create the database
  * `mix ecto.create`
  * `mix ecto.migrate`
  * Drop the database if needed with `mix ecto.drop`
    * NOTE: a fresh database is recommended when restarting the application

Add Space Track API login details
  * Make a copy of `config/space_track_EXAMPLE.exs` called `config/space_track.exs`
  * Add Space Track API login details to this new file (file is ignored by git)

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Latest TLE API
  * Endpoints
    * `GET /api/latest_tles`: retrieve latest TLEs for both (all) satellites
    * `GET /api/latest_tles/:norad_cat_id`: retrieve the latest TLE for a specified NORAD CAT id
  * TLE JSON response
    ```
    {
      id:                   binary,
      norad_cat_id:         string,
      apoapsis:             string | null,
      arg_of_pericenter:    string | null,
      bstar:                string | null,
      ccsds_omm_vers:       string | null,
    center_name:            string | null,
      classification_type:  string | null,
      comment:              string | null,
      country_code:         string | null,
    creation_date:          string | null,
      decay_date:           string | null,
      eccentricity:         string | null,
      element_set_no:       string | null,
      ephemeris_type:       string | null,
      epoch:                string | null,
      file:                 string | null,
      gp_id:                string | null,
      inclination:          string | null,
      launch_date:          string | null,
      mean_anomaly:         string | null,
      mean_element_theory:  string | null,
      mean_motion:          string | null,
      mean_motion_ddot:     string | null,
      mean_motion_dot:      string | null,
      object_name:          string | null,
      object_id:            string | null,
      object_type:          string | null,
      originator:           string | null,
    periapsis:              string | null,
      period:               string | null,
      ra_of_asc_node:       string | null,
      rcs_size:             string | null,
      ref_frame:            string | null,
      rev_at_epoch:         string | null,
      semimajor_axis:       string | null,
      site:                 string | null,
      time_system:          string | null,
      tle_line0:            string | null,
      tle_line1:            string | null,
      tle_line2:            string | null
    }
    ```

## Reference
  * App setup: https://blog.logrocket.com/build-rest-api-elixir-phoenix/
  * Scheduling tasks: https://blog.kommit.co/3-ways-to-schedule-tasks-in-elixir-i-learned-in-3-years-working-with-it-a6ca94e9e71d

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
