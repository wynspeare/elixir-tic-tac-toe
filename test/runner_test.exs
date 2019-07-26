defmodule RunnerTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "when user selects N to start new game a goodbye message is shown" do
    response = fn ->
      assert Runner.begin_game("N") == :ok
    end

    assert capture_io(response) == "Okay, Goodbye!\n"
  end

  test "user can choose default markers" do
    response = fn ->
      assert Runner.use_default_markers("Y") == {"X", "O"}
    end

    assert capture_io(response) ==
             "Let's begin!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
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
end
