defmodule TTT do
  def get_current_move(game) do
    game.current_player.marker
    |> Player.move()
    |> Validator.is_valid_move(game.board)
    |> get_current_move(game)
  end

  def get_current_move({false, move}, game) when is_integer(move) do
    Messages.get(:cell_filled)
    |> Console.display()

    get_current_move(game)
  end

  def get_current_move({false, move}, game) do
    Messages.get(:invalid_move, move)
    |> Console.display()

    get_current_move(game)
  end

  def get_current_move(is_valid, game) do
    elem(is_valid, 1)
    |> Board.place_marker(game.board, game.current_player.marker)
  end

  def turn(game) do
    board = get_current_move(game)

    if Rules.is_over(board, game.current_player.marker) do
      {Rules.is_draw(board, game.current_player.marker), %{game | board: board}}
    else
      player = TTT.switch_player(game.current_player.marker, game)
      %{game | board: board, current_player: player}
    end
  end

  def switch_player(current_player_marker, game) do
    if current_player_marker == game.player_one.marker do
      game.player_two
    else
      game.player_one
    end
  end
end
