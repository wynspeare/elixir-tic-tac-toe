defmodule Board do
  def place_marker(location, board, marker) do
    List.replace_at(board, location - 1, marker)
  end

  def is_filled(board) do
    !Enum.any?(board, fn space -> Kernel.is_integer(space) end)
  end

  def available_spaces(board) do
    Enum.filter(board, fn space -> Kernel.is_integer(space) end)
  end

  def is_space_empty(space, board) do
    {Enum.member?(available_spaces(board), space), space}
  end
end
