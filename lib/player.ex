defmodule Player do
  defstruct [:marker]

  def build(marker) do
    %Player{marker: marker}
  end

  def move(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end

