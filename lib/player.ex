# defmodule Player do
#   defstruct [:marker]

#   def build(marker) do
#     %Player{marker: marker}
#   end

#   def move(marker, io \\ IO) do
#     TTT.get_input(:get_move, marker, io)
#   end
# end



####

defprotocol Player do
  defstruct [:marker, :strategy]
  def build(marker)

  def move(marker, board, io \\ IO)
end


defimpl Player, for: Human do
  def build(marker) do
    %Player{marker: marker}
  end

  def move(marker, _, io \\ IO) do
    TTT.get_input(:get_move, marker, io)
  end
end

defimpl Player, for: Comp do
  def build(marker) do
    %Player{marker: marker}
  end

  def move(_marker, board, _io \\ IO) do
    board
    |> Board.available_cells
    |> Enum.random
  end

end
