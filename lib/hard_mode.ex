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

  def next_boards(board, {max_player, _min_player}) do
    available_moves = Board.available_cells(board)

    Enum.map(available_moves, fn move ->
      {Board.place_marker(move, board, max_player), move}
    end)
  end

  def score_next_boards(next_boards, current, {max_player, min_player}) do
    next_boards
    |> Enum.map(fn {board, move} ->
      {score(board, current, {max_player, min_player}), move}
    end)
  end

  def get_best(scores_and_moves) do
    scores_and_moves
    |> Enum.max()
    |> elem(1)
  end

  def switch_player(current_player_marker, {max_player, min_player}) do
    IO.puts("switching!")

    if current_player_marker == max_player do
      min_player
    else
      max_player
    end
  end
end
