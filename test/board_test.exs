defmodule BoardTest do
  use ExUnit.Case

  test "place_marker takes in a location (string), board, and marker and returns the board with the space filled" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert Board.place_marker(2, board, "X") == [1, "X", 3, 4, 5, 6, 7, 8, 9]
  end

  test "board with all spaces taken is completely filled" do
    board = ["X", "X", "X", "X", "O", "O", "O", "O", "O"]
    assert Board.is_filled(board) == true
  end

  test "board with an empty space is not full" do
    board = [1, "X", "X", "X", "O", "O", "O", "O", "O"]
    assert Board.is_filled(board) == false
  end
end
