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

  def handle_cast({:execute, "help", message, slack}, state) do
    manual |> Sends.send_message(message.channel, slack)
    {:noreply, state}
  end
  def handle_cast({:execute, _text, message, slack}, state) do
    Sends.send_message(":question:", message.channel, slack)
    {:noreply, state}
  end

  #####
  # Private API
  #####

  defp manual do
    "```
    All messages must be formatted: @jbot <message_here>

    ### Greeting Messages
    - @jbot Hello => Hello, @user (Hey, Good night, Good morning, Good evening and Hi can be used)

    ### Issue Messages
    - @jbot who has issue TEST-14 => Assigned User
    - @jbot explain issue TEST-14 => Description of Issue
    - @jbot status of issue TEST-14 => Current status of Issue in Jira Board
    - @jbot set issue TEST-14 as Done => Moves Issue TEST-14 to Done

    ### General Messages
    - @jbot help => Display all messages available
    - Any other message will be responded with a :question: emoji
    ```"
  end
end
