defmodule BoardTest do
  use ExUnit.Case


  test "place_marker takes in a board and a string move and returns the board with a space filled" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert Board.place_marker("2", board, "X") == [1, "X", 3, 4, 5, 6, 7, 8, 9]
  end

end
