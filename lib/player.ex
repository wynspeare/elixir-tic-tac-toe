defmodule Player do
  defstruct [:marker]

  def build(default) do
    marker = set_marker(default)
    Messages.get(:show_marker, marker)
    |> Console.display()
    %Player{marker: marker}
  end

  def set_marker(default) do
    Messages.get(:set_marker?, default)
    |> Console.get_input()
    |> set_marker(default)
  end

  def set_marker("Y", _) do
    Messages.get(:get_marker)
    |> Console.get_input()
  end

  def set_marker(_, default) do
    default
  end

  def move(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end
