defmodule BoardTest do
  use ExUnit.Case

  test "place_marker takes in a location (string), board, and marker and returns the board with the cell filled" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    assert Board.place_marker(2, board, "X") == [1, "X", 3, 4, 5, 6, 7, 8, 9]
  end

  test "board with all cells taken is completely filled" do
    board = ["X", "X", "X", "X", "O", "O", "O", "O", "O"]
    assert Board.is_filled(board) == true
  end

  test "board with an empty cell is not full" do
    board = [1, "X", "X", "X", "O", "O", "O", "O", "O"]
    assert Board.is_filled(board) == false
  end

  test "available_cells returns a list of all possible cells left" do
    board = [1, "X", "X", 4, 5, "O", "O", "O", 9]
    assert Board.available_cells(board) == [1, 4, 5, 9]
  end

  test "is_cell_empty returns true if provided location is not filled" do
    board = [1, "X", "X", 4, 5, "O", "O", "O", 9]
    assert Board.is_cell_empty(1, board) == {true, 1}
  end
end
