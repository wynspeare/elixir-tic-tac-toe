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
      assert Runner.use_default_markers?("Y") == {"X", "O"}
    end

    assert capture_io(response) ==
             "Great!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n\n"
  end
end
