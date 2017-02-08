defmodule Jbot.General do
  @moduledoc """
  Jbot.General is an action server that replies
  to all misc messages received by jbot.
  """
  use GenServer

  alias Jbot.Repo
  alias Slack.Sends

  #####
  # Public API
  #####

  def start_link do
    GenServer.start_link(__MODULE__, [], [name: :general])
  end

  #####
  # Callbacks
  #####

  def handle_cast({:execute, _text, message, slack}, state) do
    Sends.send_message(":question:", message.channel, slack)
    {:noreply, state}
  end
end
