defmodule Hard_ModeTest do
  use ExUnit.Case
  # import ExUnit.CaptureIO

  # test "score is zero for an empty board" do
  #   board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  #   assert Hard_Mode.score(board, "X") == 0
  # end

  test "score takes in a board and current player marker and is zero for a drawn game" do
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "X"]

    assert Hard_Mode.score(board, "X") == 0
  end


  test "score takes in a board and current player marker and is 10 for a won game" do
    board = ["X", "O", 3, "O", "X", 6, "O", 8, "X"]


    assert Hard_Mode.score(board, "X") == 10
  end

  test "score takes in a board and a marker and is -10 for a lost game" do
    board = ["X", "O", 3, "O", "X", 6, "O", 8, "X"]

    assert Hard_Mode.score(board, "O") == -10
  end

  test "get_minimizing_player takes in a game and a marker and provides the opposite player" do
    game = %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: %Human{marker: "X"},
      player_two: %Human{marker: "O"},
      current_player: %Human{marker: "X"}
    }
    assert Hard_Mode.get_minimizing_player(game, "X") == "O"
  end


  test "hard mode can select the best move a partially filled board" do
    # board = ["X", "O", "X", 4, "O", 6, "O", "X", "X"]
    board = [1, "X", 3, 4, 5, "X", "O", "O", "X"]
    # assert Board.available_cells(board) == [1, 4, 5, 9]


    assert Hard_Mode.minimax(board, {"O", "X"}) == 3
  end


  # test "hard mode can select the best move a partially filled board" do
  #   board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  #   output = fn -> Hard_Mode.get_random_move("X", board) |> IO.write() end

  #   assert String.to_integer(capture_io(output)) in 1..9
  # end

  # test "Hard mode can select a the last available move from the board" do
  #   board = ["O", "O", "O", "O", "O", 6, "O", "O", "O"]

  #   output = fn -> Hard_Mode.get_random_move("X", board) |> IO.write() end

  #   assert capture_io(output) == "6"
  # end
end
