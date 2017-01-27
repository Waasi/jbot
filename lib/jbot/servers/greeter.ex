defmodule Jbot.Greeter do
  @moduledoc """
  Jbot.Greeter is an action server that replies
  to all greeting messages received by jbot.
  """
  use GenServer

  alias Jbot.Repo
  alias Slack.Sends

  #####
  # Public API
  #####

  def start_link do
    GenServer.start_link(__MODULE__, [], [name: :greeter])
  end

  #####
  # Callbacks
  #####

  def handle_cast({:execute, text, message, slack}, state) do
    {:ok, user} = Repo.find_user(slack, message.user)

    new_text = text
              |> String.split(" ")
              |> Enum.map(&String.capitalize(&1))
              |> Enum.join()

    Sends.send_message("#{new_text}, @#{user.name}", message.channel, slack)
    {:noreply, state}
  end
end
