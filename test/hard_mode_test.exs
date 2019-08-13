defmodule Hard_ModeTest do
  use ExUnit.Case

  test "score is zero for an empty board" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    assert Hard_Mode.score(game) == 0
  end

  test "score is zero for a unfinished board" do
    game = %Game{
      board: ["X", 2, 3, "O", 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    assert Hard_Mode.score(game) == 0
  end

  test "score takes in a board and current player marker and is zero for a drawn game" do
    game = %Game{
      board: ["X", "X", "O", "O", "O", "X", "X", "O", "X"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    assert Hard_Mode.score(game) == 0
  end

  test "score takes in a board and current player marker and is 10 for a won game" do
    game = %Game{
      board: ["O", "X", 3, "X", "O", 6, "X", 8, "O"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.score(game) == 10
  end

  test "score takes in a board and a marker and is -10 for a lost game" do
    game = %Game{
      board: ["X", "O", 3, "O", "X", 6, "O", 8, "X"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Human{marker: "X"}
    }

    assert Hard_Mode.score(game) == -10
  end

  test "get_best_move takes in a board with two spaces left and returns the best possible move" do
    game = %Game{
      board: ["X", 2, "O", "O", 5, "X", "O", "X", "X"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 5
  end

  test "get_best_move takes in a board with 3 spaces left and returns the best possible move" do
    game = %Game{
      board: ["X", 2, "O", "O", 5, 6, "O", "X", "X"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 5
  end

  test "get_best_move takes in a board with 4 spaces left and returns the best possible move" do
    game = %Game{
      board: ["X", "O", "X", 4, "X", 6, 7, 8, "O"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 7
  end

  test "get_best_move takes in a board with 5 spaces left and returns the best possible move" do
    game = %Game{
      board: ["X", 2, "O", 4, "X", 6, 7, 8, "O"],
      player_one: %Hard_Mode{marker: "X"},
      player_two: %Human{marker: "O"},
      current_player: %Hard_Mode{marker: "X"}
    }

    assert Hard_Mode.get_best_move(game) == 6
  end

  test "get_best_move takes in a board with 6 spaces left and returns the best possible move" do
    game = %Game{
      board: [1, 2, 3, "X", "X", 6, "O", 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 6
  end

  test "get_best_move takes in a board with 7 spaces left and returns the best possible move" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, "O", 8, "X"],
      player_one: %Hard_Mode{marker: "X"},
      player_two: %Human{marker: "O"},
      current_player: %Hard_Mode{marker: "X"}
    }

    assert Hard_Mode.get_best_move(game) == 1
  end

  test "get_best_move takes in a board with 8 spaces left and returns the best possible move" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, "X"],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 1
  end

  test "get_best_move takes in an empty board and returns the best possible move" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Hard_Mode{marker: "O"},
      current_player: %Hard_Mode{marker: "O"}
    }

    assert Hard_Mode.get_best_move(game) == 1
  end
end
