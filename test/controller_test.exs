defmodule ControllerTest do
  use ExUnit.Case
  doctest Controller
  import ExUnit.CaptureIO

  test "switch_player takes in current player's marker and returns the opposite player" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Easy_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    assert Controller.switch_player("X", game) == %Easy_Mode{marker: "O"}
  end

  test "get_current_move returns an updated board when a valid move is passed in" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Human{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    output = fn ->
      assert Controller.get_current_move({true, 1}, game) == ["X", 2, 3, 4, 5, 6, 7, 8, 9]
    end

    assert capture_io(output) == "Player \"X\" selected space 1.\n"
  end

  test "user cannot move into an already filled space" do
    game = %Game{
      board: ["O", 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Human{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    output = fn -> Controller.get_current_move(game) end

    assert capture_io([input: "1\n2", capture_prompt: false], output) ==
             "That cell is filled please choose an empty location.\nPlayer \"X\" selected space 2.\n"
  end

  test "user can only enter a number for a move" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    output = fn -> Controller.get_current_move(game) end

    assert capture_io([input: "&\n1", capture_prompt: false], output) ==
             "\" & \" is not a valid space, please enter 1 - 9.\nPlayer \"X\" selected space 1.\n"
  end

  test "get_input displays a message to the console and prompts the user for input" do
    output = fn -> Controller.get_input(:get_move, "X", FakeIO) |> IO.write() end
    assert capture_io(output) == "1"
  end
end
