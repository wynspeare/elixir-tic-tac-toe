defmodule Player do
  def get_move(marker, _board) do
    get_valid_move(marker)
  end

  def get_valid_move(marker) do
    get_space(marker)
    |> Validator.is_numerical_location()
    |> is_valid_space(marker)
  end

  def is_valid_space({true, user_location}, _marker) do
    Validator.convert_input(user_location)
  end

  def is_valid_space({false, _user_location}, marker) do
    get_valid_move(marker)
  end

  def get_space(marker) do
    Messages.get(:get_move, marker)
    |> Console.get_input()
  end
end
