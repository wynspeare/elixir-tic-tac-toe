defmodule TTT do
  def start_new_game(user_answer) do
    Validator.check_user_input(user_answer)
  end

  def build_players({marker_1, marker_2}) do
    player_1 = %Player{marker: marker_1}
    player_2 = %Player{marker: marker_2}
    {player_1, player_2}
  end

  def get_current_move(game) do
    Player.get_move(game.current_player.marker, game.board)
  end

  def turn(location, game) do
    updated_board = Board.place_marker(location, game.board, game.current_player.marker)
    updated_player = TTT.switch_player(game.current_player.marker, game)

    %{game | board: updated_board, current_player: updated_player}
  end

  def switch_player(current_player_marker, game) do
    if current_player_marker == game.player_one.marker do
      game.player_two
    else
      game.player_one
    end
  end

  def build_game(players) do
    %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: elem(players, 0),
      player_two: elem(players, 1),
      current_player: elem(players, 0)
    }
  end
end
