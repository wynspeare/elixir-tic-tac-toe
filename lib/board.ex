defmodule Board do
  def place_marker(location, board, marker) do
    List.replace_at(board, location - 1, marker)
  end

  def is_filled(board) do
    !Enum.any?(board, fn cell -> Kernel.is_integer(cell) end)
  end

  def available_cells(board) do
    Enum.filter(board, fn cell -> Kernel.is_integer(cell) end)
  end

  def is_cell_empty(cell, board) do
    {Enum.member?(available_cells(board), cell), cell}
  end
end
