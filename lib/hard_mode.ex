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

    def score(board, marker) do
      cond do
        Rules.is_won(board, marker) -> 10
        Rules.is_draw(board, marker) -> 0
        !Rules.is_won(board, marker) and not Rules.is_over(board, marker) -> -10
        true -> 0
      end
  end

  def minimax(board, {max_player, min_player}) do
    if Rules.is_over(board, min_player) do
      score(board, min_player)
    end
      scores = []
      moves = []
      available_moves = Board.available_cells(board)
      # test(available_moves)
      minimax(available_moves, {max_player, min_player}, [scores], [moves], board)
  end

  # def test([head | tail]) do
  #   IO.puts(head)
  #   test(tail)
  # end

  # def test([]) do
  #   []
  # end

  def minimax([head | tail], {max_player, min_player}, [scores], [moves], board) do

    if Rules.is_over([head | tail], min_player) do
      score([head | tail], min_player)
    end

    potential_board = Board.place_marker(head, board, max_player)
    IO.puts("Potential Board: #{List.to_string(potential_board)}")

    IO.puts("Move: #{head}")



    # scores = scores ++ [score(potential_board, max_player)]
    # IO.puts("Scores: #{score(potential_board, max_player)}")

    minimax(tail, {max_player, min_player}, [scores ++ [score(potential_board, max_player)]], [moves ++ [head]], potential_board)
  end

  def minimax([], {max_player, _min_player}, [scores], [moves], _board) do
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




  # def get_best_move(_marker, board) do
  #   board
  #   |> Board.available_cells()
  #   |> Enum.random()
  # end

end
