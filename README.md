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

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Reference
  * App setup: https://blog.logrocket.com/build-rest-api-elixir-phoenix/
  * Scheduling tasks: https://blog.kommit.co/3-ways-to-schedule-tasks-in-elixir-i-learned-in-3-years-working-with-it-a6ca94e9e71d

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
