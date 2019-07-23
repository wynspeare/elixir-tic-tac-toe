defmodule TTT do
  defstruct player_one: nil,
            player_two: nil
          # current_player: nil


  def start_new_game(user_answer) do
    Validator.check_user_input(user_answer)
  end

  def get_current_move(player, board) do
    Player.get_move(player, board)
  end

  def turn(player, board) do
    get_current_move(player, board)
    |> Board.place_marker(board, player)

    # switch_player()
  end

  # def switch_player(markers) do
  # end

  def set_markers(markers) do
    %TTT{player_one: elem(markers, 0), player_two: elem(markers, 1)}
  end
end
