defmodule OptionsTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "user can see the player's markers" do
    response = fn ->
      assert Options.show_markers({"X", "O"}) == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can enter Y to play a single player game" do
    output = fn -> Options.single_player_game() end

    assert capture_io([input: "Y\nY", capture_prompt: false], output) =~
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can only enter Y/N to play a single player game" do
    output = fn -> Options.single_player_game("*") end

    assert capture_io([input: "@\nY\nY", capture_prompt: false], output) =~
             "Please enter Y/N only\n"
  end

  test "user can choose default markers" do
    response = fn ->
      assert Options.use_default_markers("Y") == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can choose custom markers" do
    response = fn -> Options.use_default_markers("N") end

    assert capture_io([input: "+\n#"], response) =~
             "Please enter a marker for Player One:\n"
  end

  test "user cannot enter anything other than Y/N when prompted to use default markers" do
    response = fn -> Options.use_default_markers("%") end

    assert capture_io([input: "y"], response) =~
             "Please enter Y/N only\n"
  end

  test "when get_markers is passed a custom marker it gets the second marker" do
    output = fn -> Options.get_markers("+") end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Let's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "users cannot choose two of the same custom markers" do
    output = fn -> Options.different_markers?({"+", "+"}) end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Choose a different symbol - they cannot be the same!\nLet's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "different_markers? returns the markers when they are different" do
    assert Options.different_markers?({"+", "^"}) == {"+", "^"}
  end
end
