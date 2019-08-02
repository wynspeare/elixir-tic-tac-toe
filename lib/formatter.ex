defmodule Formatter do
  def format_cell(cell) when is_integer(cell) do
    "| " <> Kernel.inspect(cell) <> " "
  end

  def format_cell(cell) do
    "| " <> cell <> " "
  end

  def format_cells([]) do
    []
  end

  def format_cells([head | tail]) do
    [format_cell(head) | format_cells(tail)]
  end

  def get_combo_length(board) do
    round(:math.sqrt(Kernel.length(board)))
  end

  def get_rows(board, combo_length) do
    Enum.chunk_every(board, combo_length)
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

  def add_row_dividers([head | tail]) do
    add_row_dividers([head | tail], [" \n  ———————————\n "])
  end

  def add_row_dividers([head | tail], board_container) do
    add_row_dividers(tail, board_container ++ [head] ++ ["|\n  ———————————\n "])
  end

  def add_row_dividers([], board_container) do
    board_container
  end

  def format_board(board) do
    combo_length = get_combo_length(board)

    format_cells(board)
    |> get_rows(combo_length)
    |> add_row_dividers()
  end
end
