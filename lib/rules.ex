defmodule Rules do
  def is_won(board, marker) do
    board
    |> get_combos()
    |> check_sections(marker)
  end

  def is_winning_combo(cells, marker) do
    Enum.all?(cells, fn cell -> cell == marker end)
  end

  def get_combo_length(board) do
    round(:math.sqrt(Kernel.length(board)))
  end

  def check_sections(sectioned_board, marker) do
    Enum.any?(sectioned_board, fn cells -> is_winning_combo(cells, marker) end)
  end

  def get_combos(board) do
    combo_length = get_combo_length(board)

    Formatter.split_into_rows(board) ++
      get_columns(board, combo_length) ++
      get_diagonals(board, combo_length)
  end

  def get_columns(board, combo_length) do
    [Enum.take_every(board, combo_length)]
    |> get_columns(board, combo_length)
  end

  def get_columns(chunked_board, _, combo_length) when length(chunked_board) == combo_length do
    chunked_board
  end

  def get_columns(chunk, [_ | tail], combo_length) do
    (chunk ++ [Enum.take_every(tail, combo_length)])
    |> get_columns(tail, combo_length)
  end

  def get_diagonals(board, combo_length) when is_integer(combo_length) do
    [Enum.take_every(board, combo_length + 1)]
    |> get_diagonals(board, combo_length)
  end

  def get_diagonals(chunk_1, chunk_2) do
    chunk_2 ++ [chunk_1]
  end

  def get_diagonals(chunk, board, combo_length) do
    Enum.slice(board, combo_length - 1, 10)
    |> Enum.take_every(combo_length - 1)
    |> Enum.take(combo_length)
    |> get_diagonals(chunk)
  end
end
