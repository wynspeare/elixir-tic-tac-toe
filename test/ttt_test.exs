defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

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
end
