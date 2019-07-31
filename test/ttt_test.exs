defmodule TTTTest do
  use ExUnit.Case
  doctest TTT
  import ExUnit.CaptureIO

  test "switch_player takes in current player's marker and returns the opposite player" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    assert TTT.switch_player("X", game) == %Player{marker: "O"}
  end

  test "get_current_move returns an updated board when a valid move is passed in" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    assert TTT.get_current_move({true, 1}, game) == ["X", 2, 3, 4, 5, 6, 7, 8, 9]
  end

  test "user cannot move into an already filled space" do
    game = %Game{
      board: ["O", 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    output = fn -> TTT.get_current_move(game) end

    assert capture_io([input: "1\n2", capture_prompt: false], output) ==
             "That cell is filled please choose an empty location.\n"
  end

  test "user can only enter a number for a move" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    output = fn -> TTT.get_current_move(game) end

    assert capture_io([input: "&\n1", capture_prompt: false], output) ==
             "\" & \" is not a number, please enter 1 - 9.\n"
  end

  test "get_input displays a message to the console and prompts the user for input" do
    output = fn -> TTT.get_input(:get_move, "X", FakeIO) |> IO.write() end
    assert capture_io(output) == "1"
  end
end
