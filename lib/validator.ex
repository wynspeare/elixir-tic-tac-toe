defmodule Validator do
  def check_user_input(user_answer) do
    case {:ok, user_answer} do
      {:ok, "Y"} -> "Y"
      {:ok, "N"} -> "N"
      _ -> false
    end
  end

  def convert_input(user_location), do: String.to_integer(user_location)

  def is_numerical_location(input) do
    {String.match?(input, ~r/^[0-9]*$/), input}
  end
end
