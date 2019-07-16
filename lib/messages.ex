
defmodule Messages do
  def get_message(term) do
    messages = %{
      start_game: "Do you want to play Tic Tac Toe?\n",
      choose_again: "Please enter Y/N only",
    }

    messages[term]
  end
end
