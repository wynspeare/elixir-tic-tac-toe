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

  test "turn takes in a location and board places the marker for the current player" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert TTT.turn("2", board) == [1, "X", 3, 4, 5, 6, 7, 8, 9]
  end
end
