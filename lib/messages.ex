defmodule Messages do
  def get(term) do
    messages = %{
      start_game: "Do you want to play Tic Tac Toe?\n",
      single_player: "Do you want to play a single player game?\n",
      choose_again: "Please enter Y/N only",
      welcome:
        "You have started a new game of TTT!\n\nHOW TO PLAY\n===========\nPlayers alternate placing different markers on the board until either one player has three in a row, horizontally, vertically, or diagonally; or all nine squares are filled.\nIf a player is able to draw three of their markers in a row, then that player wins.\n",
      goodbye: "Okay, Goodbye!",
      custom_markers: "Do you want to choose custom markers for the players?\n",
      cell_filled: "That cell is filled please choose an empty location.",
      draw: "This game is a draw.",
      different_markers: "Choose a different symbol - they cannot be the same!"
    }

    messages[term]
  end

  def get(term, value) do
    messages = %{
      get_move: "Player #{value} it is your turn. Please select a cell 1 - 9:\n",
      invalid_move: "\" #{value} \" is not a valid space, please enter 1 - 9.",
      winner: "#{value} is the WINNER!!",
      get_marker: "Please enter a marker for Player #{value}:\n"
    }

    messages[term]
  end

  def get(term, value_1, value_2) do
    messages = %{
      show_markers:
        "Let's begin!\n\nPlayer One - Your marker is \"#{value_1}\".\nPlayer Two - Your marker is \"#{
          value_2
        }\".\n",
      show_move: "Player \"#{value_1}\" selected space #{value_2}."
    }

    messages[term]
  end
end
