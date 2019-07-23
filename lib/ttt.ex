defmodule TTT do
  alias Validator

  def start_new_game(user_answer) do
    Validator.check_user_input(user_answer)
  end

  def turn(location, board) do
    Board.place_marker(location, board, "X")
  end
end
