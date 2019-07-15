defmodule Console do
  def get_user_input() do
    String.trim(IO.gets("Do you want to play Tic Tac Toe?\n"))
  end
end
