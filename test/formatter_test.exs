defmodule FormatterTest do
  use ExUnit.Case

  test "format empty cell adds a pipe and spaces" do
    assert(Formatter.format_cell(1) == "| 1 ")
  end

  test "format filled cell adds a pipe and spaces" do
    assert(Formatter.format_cell("X") == "| X ")
  end

  test "format_board returns a list of formatted cells" do
    assert Formatter.format_cells([1, "X"]) == ["| 1 ", "| X "]
  end

  test "a board of 9 cells has a winning combo length of 3" do
    board = [1, 2, "X", 4, 5, "X", 7, "O", "X"]
    assert Formatter.get_combo_length(board) == 3
  end

  test "a board of 16 cells has a winning combo length of 4" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16]
    assert Formatter.get_combo_length(board) == 4
  end

  test "a 9 element board can be split into column combos" do
    assert Formatter.get_columns([1, "X", 3, 4, 5, 6, "O", "X", 9], 3) == [
             [1, 4, "O"],
             ["X", 5, "X"],
             [3, 6, 9]
           ]
  end

  test "a 16 element board can be split into column combos" do
    assert Formatter.get_columns([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 4) == [
             [1, 5, 9, 13],
             [2, 6, 10, 14],
             [3, 7, 11, 15],
             [4, 8, 12, 16]
           ]
  end

  test "a 9 element board can be split into diagonal combos" do
    assert Formatter.get_diagonals([1, 2, 3, 4, 5, 6, 7, 8, 9], 3) == [
             [1, 5, 9],
             [3, 5, 7]
           ]
  end

  test "a 16 element board can be split into diagonal combos" do
    assert Formatter.get_diagonals([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16], 4) ==
             [
               [1, 6, 11, 16],
               [4, 7, 10, 13]
             ]
  end

  test "split_into_rows takes a list of 9 elements returns a chunked list of 3 rows" do
    assert Formatter.get_rows([1, "X", 3, 4, 5, 6, "O", "X", 9], 3) == [
             [1, "X", 3],
             [4, 5, 6],
             ["O", "X", 9]
           ]
  end

  test "split_into_rows takes a list of 16 elements returns a chunked list of 4 rows" do
    assert Formatter.get_rows([1, 2, 3, 4, 5, 6, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16], 4) == [
             [1, 2, 3, 4],
             [5, 6, 6, 8],
             [9, 10, 11, 12],
             [13, 14, 15, 16]
           ]
  end

  test "format_rows inserts a divider in chunked board" do
    assert Formatter.add_row_dividers([
             ["| 1 ", "| X ", "| 3 "],
             ["| 4 ", "| 5 ", "| 6 "],
             ["| O ", "| X ", "| 9 "]
           ]) ==
             [
               " \n  ———————————\n ",
               ["| 1 ", "| X ", "| 3 "],
               "|\n  ———————————\n ",
               ["| 4 ", "| 5 ", "| 6 "],
               "|\n  ———————————\n ",
               ["| O ", "| X ", "| 9 "],
               "|\n  ———————————\n "
             ]
  end
end
