defmodule Console do
  def get_input(message) do
    String.trim(IO.gets(message))
  end

  def display(message) do
    IO.puts(message)
  end

  # def display_board(board) do
  #   # IO.puts(Enum.chunk_every(board, 3))
  #   # IO.puts(Enum.chunk_every([1, 2, 3, 4, 5, 6, 7, 8, 9], 3))
  #   # Enum.intersperse([1, 2, 3, 4, 5, 6, 7, 8, 9], " | ")
  # end

  def parse_board([]), do: []

  def parse_board([head | tail]) do
    ["| " <> Kernel.inspect(head) <> " " | parse_board(tail)]
  end

  def display_board(board) do
    parse_board(board)
    |> Enum.chunk_every(3)
    |> List.insert_at(0, "  \n\n  ———————————\n ")
    |> List.insert_at(2, "|\n  ———————————\n ")
    |> List.insert_at(4, "|\n  ———————————\n ")
    |> List.insert_at(6, "|\n  ———————————\n\n")
    |> List.to_string()
    |> String.replace("\"", "", global: true)
    |> display()
  end
end
