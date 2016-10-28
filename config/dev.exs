use Mix.Config

# For development, we disable any cache and enable
# debugging and code reloading.
#
# The watchers configuration can be used to run external
# watchers to your application. For example, we use it
# with brunch.io to recompile .js and .css sources.
config :hellow_phoenix, HellowPhoenix.Endpoint,
  http: [port: {:system, "PORT"}], # 起動するPORTを環境変数から取得する
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: [node: ["node_modules/brunch/bin/brunch", "watch", "--stdin",
                    cd: Path.expand("../", __DIR__)]]


# Watch static and templates for browser reloading.
config :hellow_phoenix, HellowPhoenix.Endpoint,
  live_reload: [
    patterns: [
      ~r{priv/static/.*(js|css|png|jpeg|jpg|gif|svg)$},
      ~r{priv/gettext/.*(po)$},
      ~r{web/views/.*(ex)$},
      ~r{web/templates/.*(eex)$}
    ]
  ]

# Do not include metadata nor timestamps in development logs
config :logger, :console, format: "[$level] $message\n"

# Set a higher stacktrace during development. Avoid configuring such
# in production as building large stacktraces may be expensive.
config :phoenix, :stacktrace_depth, 20

# Configure your database
config :hellow_phoenix, HellowPhoenix.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: {:system, "DB_PASS"}, # 環境変数から取得する
  database: "hellow_phoenix_dev",
  template: "template0", # この行を追加しないと、起動時にDBを作成できない
  hostname: "localhost",
  pool_size: 10
