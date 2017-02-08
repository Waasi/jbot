defmodule Jbot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Jbot.Dispatcher, [], []),
      worker(Jbot.Greeter, [], []),
      worker(Jbot.Issuer, [], []),
      worker(Jbot.General, [], []),
      worker(Slack.Bot, [Jbot.Comm, [], Application.get_env(:jbot, :api_key)]),
    ]

    opts = [strategy: :one_for_one, name: Jbot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
