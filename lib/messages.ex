defmodule Messages do
  def get(term) do
    messages = %{
      start_game: "Do you want to play Tic Tac Toe?\n",
      choose_again: "Please enter Y/N only",
      welcome:
        "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n",
      goodbye: "Okay, Goodbye!",
      default_markers: "Do you want to use the standard markers - X and O?\n",
      get_marker: "Okay no problem! Please enter a marker for player one:\n",
      cell_filled: "That cell is filled please choose an empty location.",
      draw: "This game is a draw."
    }

    messages[term]
  end

  def get(term, value) do
    messages = %{
      get_move: "Player #{value} it is your turn. Please select a cell 1 - 9:\n",
      invalid_move: "\" #{value} \" is not a number, please enter 1 - 9.",
      winner: "#{value} is the WINNER!!",
    }

    messages[term]
  end

  def get(term, value_1, value_2) do
    messages = %{
      show_markers:
        "Let's begin!\n\nPlayer One - Your marker is \"#{value_1}\".\nPlayer Two - Your marker is \"#{
          value_2
        }\".\n"
    }

    messages[term]
  end
end
