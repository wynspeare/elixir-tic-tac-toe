defmodule Player do
  defstruct [:marker]

  def get_move(marker, board) do
    get_valid_move(marker, board)
  end

  def get_valid_move(marker, board) do
    get_cell_location(marker)
    |> Validator.is_valid_move(board)
    |> get_valid_location(marker, board)
  end

  def get_valid_location(is_valid, _marker, _board) when elem(is_valid, 0) == true do
    elem(is_valid, 1)
  end

  def get_valid_location(is_valid, marker, board) when elem(is_valid, 0) == false do
    :cell_filled |> Messages.get() |> Console.display()
    get_valid_move(marker, board)
  end

  def get_cell_location(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end
