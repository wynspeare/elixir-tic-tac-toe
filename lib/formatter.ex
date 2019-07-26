defmodule Formatter do
  def format_cells([]) do
    []
  end

  def format_cells([head | tail]) do
    [format_cell(head) | format_cells(tail)]
  end

  def split_into_rows(board) do
    Enum.chunk_every(board, round(:math.sqrt(Kernel.length(board))))
  end

  def format_cell(cell) when is_integer(cell) do
    "| " <> Kernel.inspect(cell) <> " "
  end

  def format_cell(cell) do
    "| " <> cell <> " "
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
    board
    |> format_cells()
    |> split_into_rows()
    |> add_row_dividers()
  end
end
