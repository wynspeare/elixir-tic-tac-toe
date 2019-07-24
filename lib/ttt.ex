defmodule TTT do
  # defstruct player_one: nil,
  #           player_two: nil
  #         # current_player: nil

  def start_new_game(user_answer) do
    Validator.check_user_input(user_answer)
  end

  def build_players(marker_1, marker_2) do
    player_1 = %HumanPlayer{marker: marker_1}
    player_2 = %HumanPlayer{marker: marker_2}
    {player_1, player_2}
  end

  def get_current_move(player, board) do
    # player_1 = %HumanPlayer{marker: player}
    # player.get_move(player.marker, board)
    Player.get_move(player, board)
  end

  def turn(location, board, symbols) do
    updated_board = Board.place_marker(location, board, symbols.current_player)
    symbols = TTT.switch_player(symbols.current_player, symbols)
    {updated_board, symbols}
  end

  def switch_player(current_player, symbols) do
    if current_player == symbols.player_one do
      %{symbols | current_player: symbols.player_two}
    else
      %{symbols | current_player: symbols.player_one}
    end
  end

  def set_markers(markers) do
    %Symbols{
      player_one: elem(markers, 0),
      player_two: elem(markers, 1),
      current_player: elem(markers, 0)
    }
  end
end
