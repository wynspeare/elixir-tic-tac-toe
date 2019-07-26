defmodule RulesTest do
  use ExUnit.Case

  test "is_winning_combo returns true if all elements are the same as the passed in marker" do
    assert Rules.is_winning_combo(["X", "X", "X"], "X") == true
  end

  test "is_winning_combo returns false if all elements are not the same as the passed in marker" do
    assert Rules.is_winning_combo(["X", "O", "X"], "X") == false
  end

  test "is_winning_combo returns false the passed in list is not complete" do
    assert Rules.is_winning_combo(["X", 2, "X"], "X") == false
  end

  test "a sectioned board with a winning row wins the game" do
    split_board = [["O", "O", "O"], [4, 5, 6], ["X", 8, "O"]]
    assert Rules.check_sections(split_board, "O") == true
  end

  test "a board with three horizontal markers in a row wins the game" do
    board = [1, 2, "X", 4, 5, 6, "O", "O", "O"]
    assert Rules.is_won(board, "O") == true
  end

  test "split board into columns" do
    assert Rules.get_columns([1, "X", 3, 4, 5, 6, "O", "X", 9], 3) == [
             [1, 4, "O"],
             ["X", 5, "X"],
             [3, 6, 9]
           ]
  end

  test "a board with three vertical markers in a column wins the game" do
    board = [1, 2, "X", 4, 5, "X", 7, "O", "X"]
    assert Rules.is_won(board, "X") == true
  end

  test "a board of 9 cells has a winning combo length of 3" do
    board = [1, 2, "X", 4, 5, "X", 7, "O", "X"]
    assert Rules.get_combo_length(board) == 3
  end

  test "split board into diagonal combos" do
    assert Rules.get_diagonals([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) == [
             [1, 5, 9],
             [3, 5, 7]
           ]
  end

  test "split board into diagonal combos 16" do
    assert Rules.get_diagonals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 4) == [
             [1, 6, 11, 16],
             [4, 7, 10, 13]
           ]
  end

  test "take in a board of nine elements and extract any winning combos" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    assert Rules.get_columns(board, 3) == [[1, 4, 7], [2, 5, 8], [3, 6, 9]]
  end

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
end
