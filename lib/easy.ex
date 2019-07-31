defmodule Easy do
  defstruct [:player, :marker]

  def build(marker) do
    %Easy{marker: marker}
  end

  def get_random_move(_marker, board) do
    board
    |> Board.available_cells()
    |> Enum.random()
  end
end
