defmodule RunnerTest do
  use ExUnit.Case
  import ExUnit.CaptureIO

  test "user can enter N input and not start a game" do
    output = fn -> Runner.start_game() end
    assert capture_io([input: "N", capture_prompt: false], output) == "Okay, Goodbye!\n"
  end

  test "user can play a two player game until won" do
    output = fn -> Runner.start_game() end

    assert capture_io([input: "Y\nn\nn\n1\n2\n3\n4\n5\n6\n7", capture_prompt: false], output) =~
             "X is the WINNER!!\n"
  end

  test "user can play a two player game until drawn" do
    output = fn -> Runner.start_game() end

    assert capture_io(
             [input: "Y\nn\nn\n1\n2\n3\n5\n4\n7\n8\n9\n6", capture_prompt: false],
             output
           ) =~
             "This game is a draw.\n"
  end

  test "user can play a single player game" do
    output = fn -> Runner.start_game() end

    assert capture_io(
             [input: "Y\nY\nn\n1\n2\n3\n4\n5\n6\n7\n8\n9", capture_prompt: false],
             output
           ) =~
             "You have started a new game of TTT!\n"
  end
end
