defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  import ExUnit.CaptureIO

  test "does not start new game when number is provided" do
    user_answer = 7
    assert TTT.start_new_game(user_answer) == nil
  end

  test "message prints to console when new game is chosen" do
    response = fn ->
      assert TTT.start_new_game("Y") == :ok
    end

    assert capture_io(response) == "You have started a new game of TTT!\n"
  end
end
