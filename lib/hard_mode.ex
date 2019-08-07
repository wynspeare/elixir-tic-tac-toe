defmodule Hard_Mode do
  defstruct [:marker]

  def build(marker) do
    %Hard_Mode{marker: marker}
  end


  def get_minimizing_player(game, marker) do
    if marker == game.player_one.marker do
      game.player_two.marker
    else
      game.player_one.marker
    end
  end

  def score(board, marker, {max_player, min_player}, depth) do
    cond do
      Rules.is_won(board, marker) and marker == max_player -> 10 - depth
      Rules.is_won(board, marker) and marker == min_player -> depth - 10
      true -> 0
    end
  end

  def minimax(board, current, {max_player, min_player}, depth \\ 0) do

      available_moves = Board.available_cells(board)

      Enum.map(available_moves, fn move ->
        potential_board = Board.place_marker(move, board, current)

        {minimax(potential_board, current, {max_player, min_player}, depth, move), move}
      end)
      |> get_best_score(max_player)
  end

  def minimax(board, current, {max_player, min_player}, depth, move) do
    Console.display_board(board)

    if Rules.is_over(board, current) do
      IO.puts("GAME IS OVER - draw or #{current} has won.")
      IO.puts("Score: #{score(board, current, {max_player, min_player}, depth)}")
      score(board, current, {max_player, min_player}, depth)
    else
      depth = depth + 1
      current = switch_player(current, {max_player, min_player})
      minimax(board, current, {max_player, min_player}, depth)
    end
  end

  def get_best_score(scores, max_player) do
    scores

    # if max_player == :marker do
    #   Enum.max(scores)
    #   |> elem(1)
    # else
    #   Enum.min(scores)
    #   |> elem(1)
    # end
  end


      def switch_player(current_player_marker, {max_player, min_player}) do
        IO.puts("switching!")
        if current_player_marker == max_player do
          min_player
        else
          max_player
        end
      end


end



# defmodule Hard_Mode do
#   defstruct [:marker]

#   def build(marker) do
#     %Hard_Mode{marker: marker}
#   end


#   def get_minimizing_player(game, marker) do
#     if marker == game.player_one.marker do
#       game.player_two.marker
#     else
#       game.player_one.marker
#     end
#   end

#       def score(board, marker, {max_player, min_player}) do
#         cond do
#           Rules.is_won(board, marker) and marker == max_player -> 10
#           Rules.is_won(board, marker) and marker == min_player -> -10
#           true -> 0
#         end
#       end


#   def minimax(board, {max_player, min_player}) do
#     if Rules.is_over(board, min_player) do
#       score(board, min_player, {max_player, min_player})
#     end
#       scores = []
#       moves = []
#       available_moves = Board.available_cells(board)

#       minimax(available_moves, max_player, {max_player, min_player}, [scores], [moves], board, board)
#   end


#   def minimax([head | tail], current, {max_player, min_player}, [scores], [moves], board, original_board) do

#     potential_board = Board.place_marker(head, board, current) #Place marker for O max player space 2
#     IO.puts("Potential Board - Cell: #{head} Player: #{current}")
#     IO.puts("Score: #{score(potential_board, current, {max_player, min_player})}")
#     Console.display_board(potential_board)

#     if Rules.is_over(potential_board, current) do
#       IO.puts("GAME IS OVER - draw or #{current} has won.")
#       IO.puts("SAVE score and move for this end state. Call minimax on next available space on same board.")

#       minimax(tail, current, {max_player, min_player}, [scores ++ [score(potential_board, current, {max_player, min_player})]], [moves ++ [head]], board, original_board)


#     else

#       IO.puts("Game NOT over - #{current} has not won. Switch players and call minimax on next available space on potential board")

#       current = switch_player(current, {max_player, min_player})
#       available_moves = Board.available_cells(potential_board)

#       minimax(available_moves, current, {max_player, min_player}, [scores], [moves], potential_board, original_board)
#     end
#   end


#   def minimax([], _, {max_player, _min_player}, [scores], [moves], _, _) do
#     # if max_player == :marker do
#       Enum.zip(scores, moves)
#       #   |> Enum.max()
#       #   |> elem(1)
#       # else
#       #     Enum.zip(scores, moves)
#       #     |> Enum.min()
#       #     |> elem(1)
#       #   end
#       end

#       def switch_player(current_player_marker, {max_player, min_player}) do
#         IO.puts("switching!")
#         if current_player_marker == max_player do
#           min_player
#         else
#           max_player
#         end
#       end


# end
