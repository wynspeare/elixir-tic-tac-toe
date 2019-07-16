defmodule Messages do
  def get_message(term) do
    messages = %{
      start_game: "Do you want to play Tic Tac Toe?\n",
      choose_again: "Please enter Y/N only",
      welcome:
        "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n",
      goodbye: "Okay, Goodbye!"
    }

    messages[term]
  end
end
