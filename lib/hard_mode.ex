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

  # def get_opposite_player(board, marker) do
  #   # if length(Board.available_cells(board)) /2 == 0
  #   length(Board.available_cells(board))
  # end


  #   def score(board, marker) do
    #     cond do
      #       Rules.is_won(board, marker) -> 10
      #       Rules.is_draw(board, marker) -> 0
      #       !Rules.is_won(board, marker) and not Rules.is_over(board, marker) -> -10
      #       true -> 0
      #     end
      # end

      def score(board, marker, {max_player, min_player}) do
        cond do
          Rules.is_won(board, marker) and marker == max_player -> 10
          Rules.is_won(board, marker) and marker == min_player -> -10
          true -> 0
        end
      end


  def minimax(board, {max_player, min_player}) do
    if Rules.is_over(board, min_player) do
      score(board, min_player, {max_player, min_player})
    end
      scores = []
      moves = []
      available_moves = Board.available_cells(board)

      minimax(available_moves, max_player, {max_player, min_player}, [scores], [moves], board, board)
  end


  def minimax([head | tail], current, {max_player, min_player}, [scores], [moves], board, original_board) do

    potential_board = Board.place_marker(head, board, current) #Place marker for O max player space 2
    IO.puts("Potential Board - Cell: #{head} Player: #{current}")
    IO.puts("Score: #{score(potential_board, current, {max_player, min_player})}")
    Console.display_board(potential_board)
    if Rules.is_over(potential_board, current) do
      IO.puts("GAME IS OVER - draw or #{current} has won.")
      IO.puts("SAVE score and move for this end state. Call minimax on next available space on same board.")

      minimax(tail, current, {max_player, min_player}, [scores ++ [score(potential_board, current, {max_player, min_player})]], [moves ++ [head]], board, original_board)
    else

      IO.puts("Game NOT over - #{current} has not won. Switch players and call minimax on next available space on potential board")

      current = switch_player(current, {max_player, min_player})
      available_moves = Board.available_cells(potential_board)

      minimax(available_moves, current, {max_player, min_player}, [scores], [moves], potential_board, original_board)
    end
  end


  def minimax([], _, {max_player, _min_player}, [scores], [moves], _, _) do
    if max_player == :marker do
      Enum.zip(scores, moves)
        |> Enum.max()
        |> elem(1)
      else
          Enum.zip(scores, moves)
          |> Enum.min()
          |> elem(1)
        end
      end

      def switch_player(current_player_marker, {max_player, min_player}) do
        IO.puts("switching!")
        if current_player_marker == max_player do
          min_player
        else
          max_player
        end
      end


  # def score(board, marker) do
  #   Rules.is_won(board, marker)
  #   |> score(board, marker)
  # end

  # def score(true, _, _) do #won by currentplayer
  #   10
  # end

  # def score(false, board, marker) do #not won and not draw
  #   {Rules.is_draw(board, marker), board}
  #   |> score()
  # end

  # def score({true, _}) do #draw!
  # 0
  # end

  # def score({false, board}) do #opponent won or unfinished game

  #   if !Board.is_filled(board) do
  #     0
  #   else
  #     -10
  #   end
  # end

end