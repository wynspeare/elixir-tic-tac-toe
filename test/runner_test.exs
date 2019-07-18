defmodule RunnerTest do
  use ExUnit.Case
  doctest TTT

  import ExUnit.CaptureIO

  test "when user selects Y to start new game a welcome message is shown" do
    response = fn ->
      assert Runner.begin_game?("Y") == :ok
    end

    assert capture_io(response) ==
             "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n\n"
  end

  test "when user selects N to start new game a goodbye message is shown" do
    response = fn ->
      assert Runner.begin_game?("N") == :ok
    end

    assert capture_io(response) == "Okay, Goodbye!\n"
  end

  test "user can choose default markers" do
    response = fn ->
      assert Runner.use_default_markers?("Y") == :ok
    end

    assert capture_io(response) ==
             "Great!\n\nPlayer One - Your marker is \"X\".\nPLayer Two - Your marker is \"O\".\n\n"
  end
end
