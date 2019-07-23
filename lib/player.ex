defmodule Player do
  def get_move(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end
