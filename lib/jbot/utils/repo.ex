defmodule Jbot.Repo do
  @moduledoc """
  Jbot.Repo provides functions to handle
  Slack resources management.

  ### Functions
      - find_user/2
  """

  @doc """
  The find_user/2 function takes a
  Slack.State type variable and a String
  type id. It returns {:ok, user} or
  :error.

  ### Examples
      iex> Jbot.Repo.find_user(slack, id)
      {:ok, user}

      iex> Jbot.Repo.find_user(slack, "0")
      :error
  """

  @spec find_user(Slack.State.t(), String.t()) :: {:ok, map()} | :error
  def find_user(slack, id) do
    slack.users |> Map.fetch(id)
  end
end
