defmodule Rules do
  def is_won(board, marker) do
    board
    |> get_combos()
    |> check_combos(marker)
  end

  def is_draw(board, marker) do
    Board.is_filled(board) and not is_won(board, marker)
  end

  def is_over(board, marker) do
    is_draw(board, marker) or is_won(board, marker)
  end

  def is_winning_combo(combo, marker) do
    Enum.all?(combo, fn cell -> cell == marker end)
  end

  def check_combos(sectioned_board, marker) do
    Enum.any?(sectioned_board, fn combo -> is_winning_combo(combo, marker) end)
  end

  def get_combos(board) do
    combo_length = Formatter.get_combo_length(board)

    Formatter.get_rows(board, combo_length)
    ++  Formatter.get_columns(board, combo_length)
    ++  Formatter.get_diagonals(board, combo_length)
  end
end
