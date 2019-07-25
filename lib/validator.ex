defmodule Validator do
  def check_user_input(user_answer) do
    case {:ok, user_answer} do
      {:ok, "Y"} -> "Y"
      {:ok, "N"} -> "N"
      _ -> false
    end
  end

  def convert_input({is_integer, location}) when is_integer == true do
    String.to_integer(location)
  end

  def convert_input({false, location}) do
    {false, location}
  end

  def is_numerical_location(input) do
    {String.match?(input, ~r/^[0-9]*$/), input}
  end

  def is_valid_move(cell, board) do
    is_numerical_location(cell)
    |> convert_input()
    |> Board.is_cell_empty(board)
  end
end
