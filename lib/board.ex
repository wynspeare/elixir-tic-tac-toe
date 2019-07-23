defmodule Board do
  # def place_marker(location, board, marker) do
  #   String.to_integer(location)
  #   |> (&List.replace_at(board, &1 - 1, marker)).()
  # end

  def place_marker(location, board, marker) do
    List.replace_at(board, location - 1, marker)
  end
end
