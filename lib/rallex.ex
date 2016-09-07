defmodule Rallex do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Rallex.Webhooks, []),
    ]

    opts = [strategy: :one_for_one, name: Rallex.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
