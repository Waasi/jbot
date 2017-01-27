defmodule Jbot.Dispatcher do
  @moduledoc """
  Jbot.Dispatcher defines logic to dispatch
  messages to their corresponding action
  servers.

  ### Functions
      - dispatch/3
  """

  use GenServer
  import Jbot.TypeChecker

  #####
  # Public API
  #####

  def start_link do
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  @doc """
  The dispatch/3 function takes a String type
  text parameter, a Map type message and a
  Slack.State type variable. It checks the type of
  message and dispatches it to be executed by
  the corresponding action server.

  ### Example
      iex> Jbot.Dispatcher.dispatch("Hello", message, slack)
      :ok
  """

  @spec dispatch(String.t(), map(), Slack.State.t()) :: :ok
  def dispatch(text, message, slack) do
    GenServer.cast(__MODULE__, {:run_with, text, message, slack})
  end

  #####
  # Callbacks
  #####

  def handle_cast({:run_with, text, message, slack}, state) do
    {text_type, _} = text |> type()
    text_type |> GenServer.cast({:execute, text, message, slack})

    {:noreply, state}
  end
end
