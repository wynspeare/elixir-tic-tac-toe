defmodule Console do
  def get_input(message) do
    String.trim(IO.gets(message))
  end

  def display(message) do
    IO.puts(message)
  end

  def format_board([]), do: []

  def format_board([head | tail]) do
    [format_cell(head) | format_board(tail)]
  end

  def split_into_rows(board) do
    Enum.chunk_every(board, round(:math.sqrt(Kernel.length(board))))
  end

  def format_cell(cell) when is_integer(cell), do: "| " <> Kernel.inspect(cell) <> " "
  def format_cell(cell), do: "| " <> cell <> " "

  def add_row_dividers([head | tail]),
    do: add_row_dividers([head | tail], [" \n  ———————————\n "])

  def add_row_dividers([head | tail], board_container) do
    add_row_dividers(tail, board_container ++ [head] ++ ["|\n  ———————————\n "])
  end

  def add_row_dividers([], board_container), do: board_container

  def display_board(board) do
    format_board(board)
    |> split_into_rows()
    |> add_row_dividers()
    |> display()
  end
end
