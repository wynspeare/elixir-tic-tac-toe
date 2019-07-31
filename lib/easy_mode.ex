defmodule Easy_Mode do
  defstruct [:player, :marker]

  def build(marker) do
    %Easy_Mode{marker: marker}
  end

  def get_random_move(_marker, board) do
    board
    |> Board.available_cells()
    |> Enum.random()
  end
end
