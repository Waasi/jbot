defmodule Jbot.Issuer do
  @moduledoc """
  Jbot.Issuer is an action server that replies
  to all issue related messages received by jbot.
  """
  use GenServer

  alias Jbot.Repo
  alias Slack.Sends
  alias Jirex.Issue

  #####
  # Public API
  #####

  def start_link do
    GenServer.start_link(__MODULE__, [], [name: :issuer])
  end

  #####
  # Callbacks
  #####

  def handle_cast({:execute, "who has issue " <> issue, message, slack}, state) do
    {:ok, user} = Repo.find_user(slack, message.user)
    {:ok, assigned_user} = get_assigned_user(issue)

    Sends.send_message("#{assigned_user} has issue #{String.trim(issue, "?")} assigned, @#{user.name}", message.channel, slack)
    {:noreply, state}
  end
  def handle_cast({:execute, "explain issue " <> issue, message, slack}, state) do
    {:ok, details} = get_details(issue)

    Sends.send_message(details, message.channel, slack)
    {:noreply, state}
  end
  def handle_cast({:execute, "status of issue " <> issue, message, slack}, state) do
    {:ok, status} = get_status(issue)

    Sends.send_message(status, message.channel, slack)
    {:noreply, state}
  end
  def handle_cast({:execute, _text, _msg, _slack}, state), do: {:noreply, state}

  #####
  # Private API
  #####

  defp get_assigned_user(issue_key) do
    response =
      issue_key
      |> String.trim("?")
      |> Issue.get()

    case response do
      {:ok, issue} ->
        {:ok, issue.assignee}
      {:error, error} ->
        {:ok, error}
    end
  end

  defp get_details(issue_key) do
    response =
      issue_key
      |> String.trim("?")
      |> Issue.get()

    case response do
      {:ok, issue} ->
        {:ok, "Summary:\n`#{issue.summary}`\nDescription: ```#{issue.description}```"}
      {:error, error} ->
        {:ok, error}
    end
  end

  defp get_status(issue_key) do
    response =
      issue_key
      |> String.trim("?")
      |> Issue.get()

    case response do
      {:ok, issue} ->
        {:ok, "Status: `#{issue.status}`"}
      {:error, error} ->
        {:ok, error}
    end
  end
end
