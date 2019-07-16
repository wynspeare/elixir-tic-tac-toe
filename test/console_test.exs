defmodule ConsoleTest do
  use ExUnit.Case
  alias Messages
  doctest TTT

  import ExUnit.CaptureIO

  test "instructions displayed console when user enters Y" do
    response = fn ->
      assert Console.display_welcome(
               "Y",
               Messages.get_message(:welcome),
               Messages.get_message(:goodbye)
             ) == :ok
    end

    assert capture_io(response) ==
             "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n\n"
  end
end
