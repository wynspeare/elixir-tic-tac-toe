defmodule Hard_Mode do
  defstruct [:marker]

  def build(marker) do
    %Hard_Mode{marker: marker}
  end

  def score(game, depth \\ 0) do
    human = Human.build(game.current_player.marker)
    computer = Hard_Mode.build(game.current_player.marker)

    cond do
      # Rules.is_won(game.board, game.current_player.marker) and game.current_player.marker == game.player_two.marker -> 10 - depth
      Rules.is_won(game.board, game.current_player.marker) and game.current_player == computer -> 10 - depth
      Rules.is_won(game.board, game.current_player.marker) and game.current_player == human -> depth - 10
      true -> 0
    end
  end

  # def get_best_move(
  #       board,
  #       current,
  #       max_player,
  #       min_player,
  #       over \\ false,
  #       scores \\ [],
  #       depth \\ 0
  #     )

  # def get_best_move(board, current, max_player, min_player, true, _scores, depth),
  #   do: score(board, current, max_player, min_player, depth)

  # def get_best_move(board, current, max_player, min_player, false, _scores, depth) do
  #   scores =
  #     Enum.map(board |> Board.available_cells(), fn move ->
  #       potential_board = Board.place_marker(move, board, current)
  #       current = switch_player(current, max_player, min_player)

  #       score =
  #         if depth < 5,
  #           do:
  #             get_best_move(
  #               potential_board,
  #               current,
  #               max_player,
  #               min_player,
  #               Rules.is_over(potential_board, current),
  #               [],
  #               depth + 1
  #             )

  #       {move, score}
  #     end)

  #   if depth == 0, do: best_move(scores), else: get_minimax_score(max_player, scores)
  # end
  # def get_minimax_score(max_player, scores) do
  #   if max_player == :marker do
  #     scores
  #     |> Enum.max_by(fn {_move, score} -> score end)
  #     |> elem(1)
  #   else
  #     scores
  #     |> Enum.min_by(fn {_move, score} -> score end)
  #     |> elem(1)
  #   end
  # end

  # def best_move(scores) do
  #   scores
  #   |> Enum.max_by(fn {_move, score} -> score end)
  #   |> elem(0)
  # end

  # def switch_player(current_player_marker, max_player, min_player) do
  #   if current_player_marker == max_player do
  #     min_player
  #   else
  #     max_player
  #   end
  # end
end
