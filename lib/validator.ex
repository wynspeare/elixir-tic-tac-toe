defmodule Validator do
  def check_user_input("Y") do
    true
  end

  def convert_input({is_integer, location}) when is_integer == true do
    String.to_integer(location)
  end

  def convert_input({false, location}) do
    {false, location}
  end

  def is_numerical_location(input) do
    {String.match?(input, ~r/^[1-9]*$/), input}
  end

  def is_valid_move(cell, board) when is_integer(cell) do
    cell
    |> Board.is_cell_empty(board)
  end

  def is_valid_move(cell, board) do
    is_numerical_location(cell)
    |> convert_input()
    |> Board.is_cell_empty(board)
  end
end
