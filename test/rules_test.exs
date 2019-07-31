defmodule RulesTest do
  use ExUnit.Case

  test "take in a board of nine elements zero and extract any winning combos" do
    board = [0, 1, 2, 3, 4, 5, 6, 7, 8]

    assert Rules.get_combos(board) == [
             [0, 1, 2],
             [3, 4, 5],
             [6, 7, 8],
             [0, 3, 6],
             [1, 4, 7],
             [2, 5, 8],
             [0, 4, 8],
             [2, 4, 6]
           ]
  end

  test "take in a board of 16 elements zero and extract any winning combos" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]

    assert Rules.get_combos(board) == [
             [1, 2, 3, 4],
             [5, 6, 7, 8],
             [9, 10, 11, 12],
             [13, 14, 15, 16],
             [1, 5, 9, 13],
             [2, 6, 10, 14],
             [3, 7, 11, 15],
             [4, 8, 12, 16],
             [1, 6, 11, 16],
             [4, 7, 10, 13]
           ]
  end

  test "is_winning_combo returns true if all elements for a 3 element combo are the same as the passed in marker" do
    assert Rules.is_winning_combo(["X", "X", "X"], "X") == true
  end

  test "is_winning_combo returns true if all elements for a 4 element combo are the same as the passed in marker" do
    assert Rules.is_winning_combo(["X", "X", "X", "X"], "X") == true
  end

  test "is_winning_combo returns false if all elements for a three element combo are not the same as the passed in marker" do
    assert Rules.is_winning_combo(["X", "O", "X"], "X") == false
  end

  test "is_winning_combo returns false the passed in combo is not complete" do
    assert Rules.is_winning_combo(["X", 2, "X"], "X") == false
  end

  test "a sectioned board with a winning horizontal row wins the game" do
    split_board = [["O", "O", "O"], [4, 5, 6], ["X", 8, "O"]]
    assert Rules.check_combos(split_board, "O") == true
  end

  test "a board with three horizontal markers in a row wins the game" do
    board = [1, 2, "X", 4, 5, 6, "O", "O", "O"]
    assert Rules.is_won(board, "O") == true
  end

  test "a board with three vertical markers in a column wins the game" do
    board = [1, 2, "X", 4, 5, "X", 7, "O", "X"]
    assert Rules.is_won(board, "X") == true
  end

  test "a board with three of the same diagonal markers wins the game" do
    board = ["X", 2, 3, 4, "X", 6, 7, "O", "X"]
    assert Rules.is_won(board, "X") == true
  end

  test "a board that is completely filled with no combos of 3 is not won" do
    board = ["X", "O", "X", "O", "O", "X", "O", "X", "O"]
    assert Rules.is_won(board, "O") == false
  end

  test "a board that is completely filled and is not won is a draw" do
    board = ["X", "O", "X", "O", "O", "X", "O", "X", "O"]
    assert Rules.is_draw(board, "O") == true
  end

  test "a board that is not filled and is not won is not a draw" do
    board = ["X", 2, 3, 4, "X", 6, 7, "O", "O"]
    assert Rules.is_draw(board, "O") == false
  end

  test "a board that is won is over" do
    board = ["X", "O", "X", "O", "O", "X", "O", "X", "O"]
    assert Rules.is_over(board, "O") == true
  end

  test "a board that is a draw is over" do
    board = ["X", "O", "X", "O", "O", "X", "O", "X", "O"]
    assert Rules.is_over(board, "X") == true
  end
end
