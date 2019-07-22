defmodule Messages do
  def get(term) do
    messages = %{
      start_game: "Do you want to play Tic Tac Toe?\n",
      choose_again: "Please enter Y/N only",
      welcome:
        "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n",
      goodbye: "Okay, Goodbye!",
      default_markers: "Do you want to use the standard markers - X and O?\n",
      show_default_markers:
        "Great!\n\nPlayer One - Your marker is \"X\".\nPlayer Two - Your marker is \"O\".\n",
      get_marker: "Okay no problem! Please enter a marker for player one:\n",
      # assert ~s[1 + 1 = #{1 + 1}] == "1 + 1 = 2"


    }

    messages[term]
  end

  def get(term, marker) do
  messages = %{
    get_move: "Player #{marker} it is your turn. Please select a space 1 - 9:",
  }

  messages[term]
end

end
