defmodule Hard_ModeTest do
  use ExUnit.Case
  # import ExUnit.CaptureIO

  # test "score is zero for an empty board" do
  #   board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

  #   assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  # end

  # test "score is zero for a unfinished board" do
  #   board = ["X", 2, 3, "O", 5, 6, 7, 8, 9]

  #   assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  # end

  # test "score takes in a board and current player marker and is zero for a drawn game" do
  #   board = ["X", "X", "O", "O", "O", "X", "X", "O", "X"]

  #   assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  # end


  # test "score takes in a board and current player marker and is 10 for a won game" do
  #   board = ["O", "X", 3, "X", "O", 6, "X", 8, "O"]

  #   assert Hard_Mode.score(board, "O", {"O", "X"}) == 10
  # end

  # test "score takes in a board and a marker and is -10 for a lost game" do
  #   board = ["X", "O", 3, "O", "X", 6, "O", 8, "X"]
  #   # board = ["O", "X", 3, "X", "O", 6, "X", 8, "O"]

  #   assert Hard_Mode.score(board, "X", {"O", "X"}) == -10
  # end

  # test "get_minimizing_player takes in a game and a marker and provides the opposite player" do
  #   game = %Game{
  #     board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
  #     player_one: %Human{marker: "X"},
  #     player_two: %Human{marker: "O"},
  #     current_player: %Human{marker: "X"}
  #   }
  #   assert Hard_Mode.get_minimizing_player(game, "X") == "O"
  # end


  test "hard mode can select the best move a partially filled board" do
    board = ["X", 2, "O", "O", 5, 6, "O", "X", "X"]

    assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 5
  end

  # test "7 hard mode can select the best move a partially filled board" do
  #   board = ["X", "O", "X", 4, "X", 6, 7, 8, "O"]

  #   assert Hard_Mode.minimax(board, {"O", "X"}) == 7
  # end

end
