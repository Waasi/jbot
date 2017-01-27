defmodule Jbot.RepoTest do
  use ExUnit.Case

  alias Jbot.Repo

  setup do
    slack = %Slack.State{users: %{"12345" => %{user_name: "juanito"}}}
    {:ok, slack: slack}
  end

  test "find_user with existing user", %{slack: slack} do
    assert {:ok, %{user_name: "juanito"}} = Repo.find_user(slack, "12345")
  end

  test "find_user without an existing user", %{slack: slack} do
    assert :error = Repo.find_user(slack, "123")
  end
end
