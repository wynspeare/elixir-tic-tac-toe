defmodule TTTTest do
  use ExUnit.Case
  doctest TTT

  test "user can start new game when Y is entered" do
    user_answer = "Y"
    assert TTT.start_new_game(user_answer) == "Y"
  end

  test "does not start new game when number is provided" do
    user_answer = 7
    assert TTT.start_new_game(user_answer) == false
  end

  test "switch_player takes in current player's marker and returns the opposite player" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    assert TTT.switch_player("X", game) == %Player{marker: "O"}
  end

  test "turn takes in a cell location and game and returns a game with updated board and switched current player" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Player{marker: "X"},
      player_two: %Player{marker: "O"},
      current_player: %Player{marker: "X"}
    }

    assert TTT.turn(1, game) == %Game{
             board: ["X", 2, 3, 4, 5, 6, 7, 8, 9],
             player_one: %Player{marker: "X"},
             player_two: %Player{marker: "O"},
             current_player: %Player{marker: "O"}
           }
  end
end
