defmodule Console do
  def get_input(message, io \\ IO) do
    message
    |> io.gets()
    |> String.trim()
    |> String.first()
    |> get_input(message, io)
  end

  def get_input(nil, _, io) do
    get_input("Try again.\n", io)
  end

  def get_input(message, _, _io) do
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
