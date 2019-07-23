defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  test "user can start new game when Y is entered" do
    user_answer = "Y"
    assert TTT.start_new_game(user_answer) == "Y"
  end

  test "does not start new game when number is provided" do
    user_answer = 7
    assert TTT.start_new_game(user_answer) == false
  end
end
