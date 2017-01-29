defmodule Jbot.TypeChecker do
  @moduledoc """
  Jbot.TypeChecker provides logic to
  classify a message and assign an
  action server to be dispatched to.

  ### Functions
      - type/1
  """

  @greetings ["hello", "hey", "hi", "good night", "good morning", "good evening"]

  #####
  # Public API
  #####

  @doc """
  The type/1 function takes a String
  type message and it returns a tuple
  containing the atom for the action
  and the message.

  ### Examples
      iex> Jbot.TypeChecker.type("Hello")
      {:greeter, "Hello"}

      iex> Jbot.TypeChecker.type("who has issue TEST-14")
      {:issuer, "who has issue TEST-14"}
  """

  @spec type(String.t()) :: {atom(), String.t()}
  def type(msg) do
    {:unknown, msg} |> is_greeting() |> is_issuer()
  end

  #####
  # Private API
  #####

  defp is_greeting({:unknown, msg}) do
    if Enum.member?(@greetings, String.downcase(msg)) do
      {:greeter, msg}
    else
      {:unknown, msg}
    end
  end
  defp is_greeting({msg_type, msg}), do: {msg_type, msg}

  defp is_issuer({:unknown, msg}) do
    if String.contains?(String.downcase(msg), "issue") do
      {:issuer, msg}
    else
      {:unknown, msg}
    end
  end
  defp is_issuer({msg_type, msg}), do: {msg_type, msg}
end
