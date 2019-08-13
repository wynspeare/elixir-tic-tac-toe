defmodule HumanTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "get_move takes in a marker and asks a player for their selected move" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    output = fn -> Human.get_move("X", board) |> elem(1) |> IO.write() end

    assert capture_io("1", output) == "Player X it is your turn. Please select a cell 1 - 9:\n1"
  end

  test "using FakeIO move takes in a marker and asks a player for their selected move" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    output = fn -> Human.get_move("X", board, FakeIO) |> elem(1) |> IO.write() end
    assert capture_io(output) == "1"
  end
end
