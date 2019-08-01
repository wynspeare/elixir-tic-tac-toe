defmodule RunnerTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "when user selects N to start new game a goodbye message is shown" do
    response = fn ->
      assert Runner.begin_game("N") == :ok
    end

    assert capture_io(response) == "Okay, Goodbye!\n"
  end

  test "user can see the player's markers" do
    response = fn ->
      assert Runner.show_markers({"X", "O"}) == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can be prompted to choose again" do
    response = fn ->
      assert Runner.choose_again() == :ok
    end

    assert capture_io(response) == "Please enter Y/N only\n"
  end

  test "user can only enter Y/N to begin a new game" do
    output = fn -> Runner.begin_game("&") end

    assert capture_io([input: "%\n#\nn", capture_prompt: false], output) =~
             "Please enter Y/N only\n"
  end

  test "user can enter N input and not start a game" do
    output = fn -> Runner.start_game() end
    assert capture_io([input: "N", capture_prompt: false], output) == "Okay, Goodbye!\n"
  end

  test "user can play a two player game until won" do
    output = fn -> Runner.start_game() end

    assert capture_io([input: "Y\nn\ny\n1\n2\n3\n4\n5\n6\n7", capture_prompt: false], output) =~
             "X is the WINNER!!\n"
  end

  test "user can play a two player game until drawn" do
    output = fn -> Runner.start_game() end

    assert capture_io(
             [input: "Y\nn\ny\n1\n2\n3\n5\n4\n7\n8\n9\n6", capture_prompt: false],
             output
           ) =~
             "This game is a draw.\n"
  end

  test "user can enter Y to play a single player game" do
    output = fn -> Runner.single_player_game() end

    assert capture_io([input: "Y\nY", capture_prompt: false], output) =~
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can only enter Y/N to play a single player game" do
    output = fn -> Runner.single_player_game("*") end

    assert capture_io([input: "@\nY\nY", capture_prompt: false], output) =~
             "Please enter Y/N only\n"
  end

  test "user can play a single player game" do
    output = fn -> Runner.start_game() end

    assert capture_io(
             [input: "Y\nY\nY\n1\n2\n3\n4\n5\n6\n7\n8\n9", capture_prompt: false],
             output
           ) =~
             "You have started a new game of TTT!\n"
  end

  test "user can choose default markers" do
    response = fn ->
      assert Runner.use_default_markers("Y") == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end

  test "user can choose custom markers" do
    response = fn -> Runner.use_default_markers("N") end

    assert capture_io([input: "+\n#"], response) =~
             "Please enter a marker for Player One:\n"
  end

  test "user cannot enter anything other than Y/N when prompted to use default markers" do
    response = fn -> Runner.use_default_markers("%") end

    assert capture_io([input: "y"], response) =~
             "Please enter Y/N only\n"
  end

  test "when get_markers is passed a custom marker it gets the second marker" do
    output = fn -> Runner.get_markers("+") end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Let's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "users cannot choose two of the same custom markers" do
    output = fn -> Runner.different_markers?({"+", "+"}) end

    assert capture_io([input: "@", capture_prompt: false], output) ==
             "Choose a different symbol - they cannot be the same!\nLet's begin!\n\nPlayer One - Your marker is \"+\".\nPlayer Two - Your marker is \"@\".\n\n"
  end

  test "different_markers? returns the markers when they are different" do
    assert Runner.different_markers?({"+", "^"}) == {"+", "^"}
  end
end
