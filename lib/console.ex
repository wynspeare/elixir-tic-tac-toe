defmodule Console do
  def get_input(message) do
    String.trim(IO.gets(message))
    |> String.capitalize()
    |> String.first()
  end

  def display(message) do
    IO.puts(message)
  end

  def display_board(board) do
    Formatter.format_board(board)
    |> display()
  end
end
