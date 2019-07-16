defmodule Console do
  def get_user_input(message) do
    String.trim(IO.gets(message))
  end

  def display_message(message) do
    IO.puts(message)
  end

  def display_welcome(user_answer) do
    if user_answer == "Y" do
      IO.puts("You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n")
    else
      IO.puts("Goodbye!")
    end
  end
end
