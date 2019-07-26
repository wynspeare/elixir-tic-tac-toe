defmodule RunnerTest do
  use ExUnit.Case

  import ExUnit.CaptureIO

  test "when user selects Y to start new game a welcome message is shown" do
    fn ->
      assert capture_io(Runner.run("Y")) == 
        "You have started a new game of TTT!\n\n
        HOW TO PLAY\n
        ===========\n
        Players alternate placing different markers 
        on the board until either one player has 
        three in a row, horizontally, vertically, or diagonally; 
        or all nine squares are filled.\n
        If a player is able to draw three of their markers in a row, 
        then that player wins.\n\n"
    end
  end

  test "when user selects N to start new game a goodbye message is shown" do
    response = fn ->
      assert Runner.run("N") == :ok
    end

    assert capture_io(response) == "Okay, Goodbye!\n"
  end
end
