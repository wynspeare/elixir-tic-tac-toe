defmodule BoardTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "user can see a board of 1 - 9" do
    response = fn ->
      assert Console.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9]) == :ok
    end

    assert capture_io(response) ==
            "  \n\n  ———————————\n | 1 | 2 | 3 |\n  ———————————\n | 4 | 5 | 6 |\n  ———————————\n | 7 | 8 | 9 |\n  ———————————\n\n\n"
  end

  test "user can see a board with X/O strings and integers" do
    response = fn ->
      assert Console.display_board([1, "X", 3, "O", 5, 6, 7, 8, 9]) == :ok
    end

    assert capture_io(response) ==
            "  \n\n  ———————————\n | 1 | X | 3 |\n  ———————————\n | O | 5 | 6 |\n  ———————————\n | 7 | 8 | 9 |\n  ———————————\n\n\n"
  end
end
