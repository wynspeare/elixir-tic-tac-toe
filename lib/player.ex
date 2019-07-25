defmodule Player do
  defstruct [:marker]

  def get_move(marker, board) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
    |> Validator.is_valid_move(board)
    |> get_move(marker, board)
  end

  def get_move({false, location}, marker, board) when is_integer(location) do
    Messages.get(:cell_filled) |> Console.display()
    get_move(marker, board)
  end

  def get_move({false, location}, marker, board) do
    Messages.get(:invalid_move, location) |> Console.display()
    get_move(marker, board)
  end

  def get_move({true, location}, _, _) do
    location
  end
end
