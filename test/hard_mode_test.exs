defmodule Hard_ModeTest do
  use ExUnit.Case

  test "score is zero for an empty board" do
    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]

    assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  end

  test "score is zero for a unfinished board" do
    board = ["X", 2, 3, "O", 5, 6, 7, 8, 9]

    assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  end

  test "score takes in a board and current player marker and is zero for a drawn game" do
    board = ["X", "X", "O", "O", "O", "X", "X", "O", "X"]

    assert Hard_Mode.score(board, "X", {"O", "X"}) == 0
  end

  test "score takes in a board and current player marker and is 10 for a won game" do
    board = ["O", "X", 3, "X", "O", 6, "X", 8, "O"]

    assert Hard_Mode.score(board, "O", {"O", "X"}) == 10
  end

  test "score takes in a board and a marker and is -10 for a lost game" do
    board = ["X", "O", 3, "O", "X", 6, "O", 8, "X"]

    assert Hard_Mode.score(board, "X", {"O", "X"}) == -10
  end

  test "next_boards returns all potential next boards" do
    board = ["X", 2, "O", "O", 5, "X", "O", "X", "X"]

    assert Hard_Mode.next_boards(board, {"O", "X"}) ==
             [
               {["X", "O", "O", "O", 5, "X", "O", "X", "X"], 2},
               {["X", 2, "O", "O", "O", "X", "O", "X", "X"], 5}
             ]
  end

  test "score_next_boards takes potential boards returns moves with scores" do
    next_boards = [
      {["X", "O", "O", "O", 5, "X", "O", "X", "X"], 2},
      {["X", 2, "O", "O", "O", "X", "O", "X", "X"], 5}
    ]

    assert Hard_Mode.score_next_boards(next_boards, "O", {"O", "X"}) == [{0, ["X", "O", "O", "O", 5, "X", "O", "X", "X"], 2}, {10, 5}]
  end

  test "get_best returns the move with the highest score from 2 element list" do
    scores_and_moves = [{0, 2}, {10, 5}]

    assert Hard_Mode.get_best(scores_and_moves) == 5
  end

  test "get_best returns the move with the highest score from 5 element list" do
    scores_and_moves = [{0, 2}, {10, 5}, {-20, 6}, {10, 3}, {9, 9}]

    assert Hard_Mode.get_best(scores_and_moves) == 5
  end

  test "minimax takes in a board with two spaces left and returns the best possible move" do
    board = ["X", 2, "O", "O", 5, "X", "O", "X", "X"]

    assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 5
  end

  test "minimax takes in a board with 3 spaces left and returns the best possible move" do
    board = ["X", 2, "O", "O", 5, 6, "O", "X", "X"]

    assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 5
  end

  #   test "minimax takes in a board with 4 spaces left and returns the best possible move" do
  #   board = ["X", "O", "X", 4, "X", 6, 7, 8, "O"]

  #   assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 7
  # end

  test "next level takes in a tree and players and move and calculates boards?" do
    tree = [
      {0, ["X", "O", "O", "O", 5, 6, "O", "X", "X"], 2},
      {10, 5},
      {0, ["X", 2, "O", "O", 5, "O", "O", "X", "X"], 6}
    ]
    assert Hard_Mode.next_level(tree, "O", {"O", "X"}) == 5
  end

  test "get next board scores for 4 spaces" do
    board = ["X", "O", "X", 4, "X", 6, 7, 8, "O"]

    # assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 7
    assert Hard_Mode.next_boards(board, {"O", "X"}) |> Hard_Mode.score_next_boards("O", {"O", "X"}) == [
      {0, ["X", "O", "X", "O", "X", 6, 7, 8, "O"], 4},
      {0, ["X", "O", "X", 4, "X", "O", 7, 8, "O"], 6},
      {0, ["X", "O", "X", 4, "X", 6, "O", 8, "O"], 7},
      {0, ["X", "O", "X", 4, "X", 6, 7, "O", "O"], 8}
    ]
  end

  # test "get next level scores for 4 spaces" do
  #   tree = [
  #     {0, ["X", "O", "X", "O", "X", 6, 7, 8, "O"], 4},
  #     {0, ["X", "O", "X", 4, "X", "O", 7, 8, "O"], 6},
  #     {0, ["X", "O", "X", 4, "X", 6, "O", 8, "O"], 7},
  #     {0, ["X", "O", "X", 4, "X", 6, 7, "O", "O"], 8}
  #   ]

  #   # assert Hard_Mode.minimax(board, "O", {"O", "X"}) == 7
  #   assert Hard_Mode.next_level(tree, "O", {"O", "X"}) == 5
  # end
end

