defmodule Jbot.TypeCheckerTest do
  use ExUnit.Case

  alias Jbot.TypeChecker

  test "type with greeting msg" do
    assert {:greeter, "Hello"} = TypeChecker.type("Hello")
  end

  test "type with an unknown msg" do
    assert {:unknown, "Tirijala"} = TypeChecker.type("Tirijala")
  end
end
