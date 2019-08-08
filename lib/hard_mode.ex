defmodule Hard_Mode do
  defstruct [:marker]

  def build(marker) do
    %Hard_Mode{marker: marker}
  end

  def score(board, marker, {max_player, min_player}) do
    cond do
      Rules.is_won(board, marker) and marker == max_player -> 10
      Rules.is_won(board, marker) and marker == min_player -> -10
      true -> 0
    end
  end

  def minimax(board, current, {max_player, min_player}) do
    next_boards(board, {max_player, min_player})
    |> score_next_boards(current, {max_player, min_player})
    |> next_level(current, {max_player, min_player})
    # |> get_best()
  end

  def next_boards(board, {max_player, _min_player}) do
    available_moves = Board.available_cells(board)

    Enum.map(available_moves, fn move ->
      {Board.place_marker(move, board, max_player), move}
    end)
  end

  def score_next_boards(next_boards, current, {max_player, min_player}) do
    next_boards
    |> Enum.map(fn {board, move} ->
      if is_list(board) do
        if Rules.is_over(board, current) do
          {score(board, current, {max_player, min_player}), move}
        else
          {score(board, current, {max_player, min_player}), board, move}
        end
      end
    end)
  end

  def next_level(tree, current, {max_player, min_player}) do
    tree
    |> Enum.map(fn potential_board ->
      if is_list(elem(potential_board, 1)) do

        current = switch_player(current, {max_player, min_player})

        elem(potential_board, 1)

        |> next_boards({min_player, max_player})
        |> score_next_boards(current, {max_player, min_player}, elem(potential_board, 2))
      else
        potential_board
      end
    end)
    |> List.flatten()
    |> get_best()

  end

  def score_next_boards(next_boards, current, {max_player, min_player}, original_move) do
    next_boards
    |> Enum.map(fn {board, _} ->
      if is_list(board) do
        if Rules.is_over(board, current) do
          {score(board, current, {max_player, min_player}), original_move}
        else
          [{score(board, current, {max_player, min_player}), board, original_move}]
          |> next_level(current, {max_player, min_player})
        end
      end
    end)
  end

  def get_best(scores_and_moves) do
    scores_and_moves
    |> Enum.max()
    |> elem(1)
  end


  def switch_player(current_player_marker, {max_player, min_player}) do
    if current_player_marker == max_player do
      min_player
    else
      max_player
    end
  end
end
