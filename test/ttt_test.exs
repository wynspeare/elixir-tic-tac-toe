defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  import ExUnit.CaptureIO

  test "does not start new game when number is provided" do
    user_answer = 7
    assert TTT.start_new_game(user_answer) == false
  end

  test "instructions displayed console when new game is started" do
    response = fn ->
      assert Console.display_welcome("Y") == :ok
    end

    assert capture_io(response) == "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n\n"
  end
end
