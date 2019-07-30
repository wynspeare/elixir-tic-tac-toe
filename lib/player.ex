defmodule Player do
  defstruct [:marker]

  def build(marker) do
    %Player{marker: marker}
  end

  def move(marker, io \\ IO) do
    TTT.get_input(:get_move, marker, io)
  end
end
