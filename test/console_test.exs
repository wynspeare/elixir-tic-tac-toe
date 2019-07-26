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

  test "user can see a board of 1 - 9" do
    response = fn ->
      assert Console.display_board([1, 2, 3, 4, 5, 6, 7, 8, 9]) == :ok
    end

    assert capture_io(response) ==
             " \n  ———————————\n | 1 | 2 | 3 |\n  ———————————\n | 4 | 5 | 6 |\n  ———————————\n | 7 | 8 | 9 |\n  ———————————\n \n"
  end

  test "user can see a board with X/O strings and integers" do
    response = fn ->
      assert Console.display_board([1, "X", 3, "O", 5, 6, 7, 8, 9]) == :ok
    end

    assert capture_io(response) ==
             " \n  ———————————\n | 1 | X | 3 |\n  ———————————\n | O | 5 | 6 |\n  ———————————\n | 7 | 8 | 9 |\n  ———————————\n \n"
  end
end
