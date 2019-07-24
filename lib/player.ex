defmodule Player do
  defstruct [:marker]

  def get_move(marker, board) do
    get_valid_move(marker, board)
  end

  def get_valid_move(marker, board) do
    get_space(marker)
    |> Validator.is_valid_move(board)
    |> is_valid_space(marker, board)
  end

  def is_valid_space({true, move}, _marker, _board) do
    move
  end

  def is_valid_space({false, _move}, marker, board) do
    :cell_filled |> Messages.get() |> Console.display()
    get_valid_move(marker, board)
  end

  def get_space(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end
