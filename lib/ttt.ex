defmodule TTT do
  alias Validator

  def start_new_game(user_answer) do
    Validator.check_user_input(user_answer)
  end
end
