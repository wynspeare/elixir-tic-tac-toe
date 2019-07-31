defmodule Human do
  defstruct [:player, :marker]

  def build(marker) do
    %Human{marker: marker}
  end

  def get_move(marker, _board) do
    TTT.get_input(:get_move, marker)
  end
end
