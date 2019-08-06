defmodule ConfigurationTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "when user selects N to start new game a goodbye message is shown" do
    response = fn ->
      assert Configuration.build_game("N") == :ok
    end

    assert capture_io(response) == "Okay, Goodbye!\n"
  end

  test "user can be prompted to choose again" do
    response = fn ->
      assert Configuration.choose_again() == :ok
    end

    assert capture_io(response) == "Please enter Y/N only\n"
  end

  test "user can only enter Y/N to begin a new game" do
    output = fn -> Configuration.build_game("&") end

    assert capture_io([input: "%\n#\nn", capture_prompt: false], output) =~
             "Please enter Y/N only\n"
  end

  test "user can see the player's markers" do
    response = fn ->
      assert Configuration.show_markers({"X", "O"}) == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can enter Y to play a single player game" do
    output = fn -> Configuration.single_player_game() end

    assert capture_io([input: "Y\nN", capture_prompt: false], output) =~
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can only enter Y/N to play a single player game" do
    output = fn -> Configuration.single_player_game("*") end

    assert capture_io([input: "@\nY\nn", capture_prompt: false], output) =~
             "Please enter Y/N only\n"
  end

  test "user can choose default markers" do
    response = fn ->
      assert Configuration.use_custom_markers("N") == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can choose custom markers" do
    response = fn -> Configuration.use_custom_markers("Y") end

    assert capture_io([input: "+\n#"], response) =~
             "Please enter a marker for Player One:\n"
  end

  test "user cannot enter anything other than Y/N when prompted to use custom markers" do
    response = fn -> Configuration.use_custom_markers("%") end

    assert capture_io([input: "n"], response) =~
             "Please enter Y/N only\n"
  end

  test "when get_markers is passed a custom marker it gets the second marker" do
    output = fn -> Configuration.get_markers("+") end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Let's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "users cannot choose two of the same custom markers" do
    output = fn -> Configuration.different_markers?({"+", "+"}) end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Choose a different symbol - they cannot be the same!\nLet's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "different_markers? returns the markers when they are different" do
    assert Configuration.different_markers?({"+", "^"}) == {"+", "^"}
  end
end
