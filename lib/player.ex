defmodule Player do
  defstruct [:marker]

  def get_move(marker, board) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
    |> Validator.is_valid_move(board)
    |> get_move(marker, board)
  end

  def get_move(is_valid, marker, board) when elem(is_valid, 0) == false do
    Messages.get(:cell_filled) |> Console.display()
    get_move(marker, board)
  end

  def get_move(is_valid, _, _) do
    elem(is_valid, 1)
  end
end
