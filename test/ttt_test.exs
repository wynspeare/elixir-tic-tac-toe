defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  test "starts new game when Y is provided" do
    user_answer = "Y"
    assert TTT.start_new_game(user_answer) == :ok
  end

  test "does not start new game when N is provided" do
    user_answer = "N"
    assert TTT.start_new_game(user_answer) == nil
  end
end
