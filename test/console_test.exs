defmodule ConsoleTest do
  use ExUnit.Case
  alias Messages
  doctest TTT

  import ExUnit.CaptureIO

  test "provided message displays to the console" do
    response = fn ->
      assert :welcome |> Messages.get() |> Console.display() == :ok
    end

    assert capture_io(response) ==
             "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n\n"
  end
end
