defmodule TTT do
  def start_new_game(user_answer) do
    if String.valid?(user_answer) do
      case {:ok, user_answer} do
        {:ok, "Y"} -> IO.puts("You have started a new game of TTT!")
        {:ok, "N"} -> IO.puts("Goodbye!")
        _ -> IO.puts("Please enter Y/N only.")
      end
    else
      nil
    end
  end
end
