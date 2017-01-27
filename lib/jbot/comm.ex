defmodule Jbot.Comm do
  use Slack

  alias Jbot.Dispatcher

  #####
  # Callbacks
  #####

  def handle_connect(_slack, state), do: {:ok, state}

  def handle_event(message = %{text: "<@U3X9WDUJY>", type: "message"}, slack, state) do
    send_message("You called my lord?", message.channel, slack)
    {:ok, state}
  end
  def handle_event(%{type: "message", text: "<@U3X9WDUJY> " <> text} = message, slack, state) do
    Dispatcher.dispatch(text, message, slack)
    {:ok, state}
  end
  def handle_event(_, _, state), do: {:ok, state}
end
