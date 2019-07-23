defmodule Validator do
  def check_user_input(user_answer) do
    case {:ok, user_answer} do
      {:ok, "Y"} -> "Y"
      {:ok, "N"} -> "N"
      _ -> false
    end
  end

  def convert_input(user_location) when elem(user_location, 0) == true,
    do: String.to_integer(elem(user_location, 1))

  def is_numerical_location(input) do
    {String.match?(input, ~r/^[0-9]*$/), input}
  end

  def is_valid_move(cell, board) do
    is_numerical_location(cell)
    |> convert_input()
    |> Board.is_space_empty(board)
  end
end
