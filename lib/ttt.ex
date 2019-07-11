defmodule TTT do

  def start_new_game(user_answer) do
    if user_answer == "Y", do:  IO.puts("You have started a new game of TTT!")
  end
end
