defmodule PlayerTest do
  use ExUnit.Case

  import ExUnit.CaptureIO


  test "move takes in a marker and asks a player for their selected move" do
    output = fn -> Player.move("X") |> IO.write end

    assert capture_io("1", output) == "Player X it is your turn. Please select a cell 1 - 9:\n1"
  end
end
