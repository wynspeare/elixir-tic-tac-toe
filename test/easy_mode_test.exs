defmodule Easy_ModeTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "Easy mode can select a random move from the board" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    output = fn -> Easy_Mode.get_random_move("X", board) |> IO.write() end

    assert String.to_integer(capture_io(output)) in 1..9
  end

  test "Easy mode can select a the last available move from the board" do
    board = ["O", "O", "O", "O", "O", 6, "O", "O", "O"]

    output = fn -> Easy_Mode.get_random_move("X", board) |> IO.write() end

    assert capture_io(output) == "6"
  end
end
