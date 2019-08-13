defmodule Hard_Mode do
  defstruct [:marker]

  def build(marker) do
    %Hard_Mode{marker: marker}
  end

  def score(game, depth \\ 0) do
    human = Human.build(game.current_player.marker)
    computer = Hard_Mode.build(game.current_player.marker)

    cond do
      Rules.is_won(game.board, game.current_player.marker) and game.current_player == computer ->
        10 - depth

      Rules.is_won(game.board, game.current_player.marker) and game.current_player == human ->
        depth - 10

      true ->
        0
    end
  end

  def get_best_move(game, over \\ false, scores \\ [], depth \\ 0)

  def get_best_move(game, true, _scores, depth),
    do: score(game, depth)

  def get_best_move(game, false, _scores, depth) do
    scores =
      Enum.map(game.board |> Board.available_cells(), fn move ->
        new_game = %{
          game
          | board: Board.place_marker(move, game.board, game.current_player.marker),
            current_player: Controller.switch_player(game.current_player.marker, game)
        }

        score =
          if depth < 5,
            do:
              get_best_move(
                new_game,
                Rules.is_over(new_game.board, new_game.current_player.marker),
                [],
                depth + 1
              )

        {move, score}
      end)

    if depth == 0, do: best_move(scores), else: get_minimax_score(game.player_two.marker, scores)
  end

  # def get_minimax_score(max_player, scores) do
  #   move = if max_player == :marker do
  #         scores
  #         |> Enum.max_by(fn {_move, score} -> score end)
  #         |> elem(1)
  #       else
  #         scores
  #         |> Enum.min_by(fn {_move, score} -> score end)
  #         |> elem(1)
  #       end
  #       {true, move}

  # end

  # def best_move(scores) do
  # move = scores
  #   |> Enum.max_by(fn {_move, score} -> score end)
  #   |> elem(0)
  #   {true, move}
  # end

  def get_minimax_score(max_player, scores) do
    if max_player == :marker do
      scores
      |> Enum.max_by(fn {_move, score} -> score end)
      |> elem(1)
    else
      scores
      |> Enum.min_by(fn {_move, score} -> score end)
      |> elem(1)
    end
  end

  def best_move(scores) do
    scores
    |> Enum.max_by(fn {_move, score} -> score end)
    |> elem(0)
  end
end
