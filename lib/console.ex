defmodule Console do
  def get_input(message) do
    message
    |> IO.gets()
    |> String.trim()
    |> String.first()
    |> get_input(message)
  end

  def get_input(nil, _) do
    get_input("Try again.\n")
  end

  def get_input(message, _) do
    String.capitalize(message)
  end

  def display(message) do
    message
    |> IO.puts()
  end

  def display_board(board) do
    board
    |> Formatter.format_board()
    |> display()
  end
end
