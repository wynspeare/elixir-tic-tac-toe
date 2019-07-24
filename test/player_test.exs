defmodule PlayerTest do
  use ExUnit.Case

  test "get_valid_location returns the cell location if the move is valid" do
    board = [1, "X", "X", 4, 5, "O", "O", "O", 9]
    valid_move = Validator.is_valid_move("1", board)
    assert Player.get_valid_location(valid_move, "X", board) == 1
  end
end
