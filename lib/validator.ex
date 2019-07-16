defmodule Validator do
  def check_user_input(user_answer) do
    case {:ok, user_answer} do
      {:ok, "Y"} -> "Y"
      {:ok, "N"} -> "N"
      _ -> false
    end
  end

  def convert_user_input(user_answer) do
    case user_answer do
      "Y" -> true
      "N" -> false
    end
  end
end
