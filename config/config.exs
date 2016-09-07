use Mix.Config

config :rallex,
  rally_api_key: System.get_env("RALLY_API_KEY")

config :logger, level: :debug

config :mix_test_watch,
  tasks: [
    "test",
    "dialyzer",
  ],
  clear: true

import_config "#{Mix.env}.exs"
