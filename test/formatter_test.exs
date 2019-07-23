defmodule FormatterTest do
  use ExUnit.Case
  doctest TTT

  test "format empty cell adds a pipe and spaces", do: assert(Formatter.format_cell(1) == "| 1 ")

  test "format filled cell adds a pipe and spaces",
    do: assert(Formatter.format_cell("X") == "| X ")

  test "format_board returns a list of formatted cells" do
    assert Formatter.format_cells([1, "X"]) == ["| 1 ", "| X "]
  end

  test "split_into_rows takes a list of 9 elements returns a chunked list of 3 rows" do
    assert Formatter.split_into_rows([1, "X", 3, 4, 5, 6, "O", "X", 9]) == [
             [1, "X", 3],
             [4, 5, 6],
             ["O", "X", 9]
           ]
  end

  test "split_into_rows takes a list of 16 elements returns a chunked list of 4 rows" do
    assert Formatter.split_into_rows([1, 2, 3, 4, 5, 6, 6, 8, 9, 10, 11, 12, 13, 14, 15, 16]) == [
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
