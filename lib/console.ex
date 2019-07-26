defmodule Console do
  def get_input(message) do
    trimmed = IO.gets(message) |> String.trim() |> String.first()
    get_input(message, trimmed)
  end

  def get_input(_, nil) do
    get_input("Try again.\n")
  end

  def get_input(_, trimmed) do
    String.capitalize(trimmed)
  end

  def display(message) do
    IO.puts(message)
  end

  def display_board(board) do
    Formatter.format_board(board)
    |> display()
  end
end
