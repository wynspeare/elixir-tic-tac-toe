defmodule Console do
  def get_user_input(message) do
    String.trim(IO.gets(message))
  end

  def display_message(message) do
    IO.puts(message)
  end

  def display_cond_message(user_answer, yes_msg, no_msg) do
    if user_answer == true do
      IO.puts(yes_msg)
    else
      IO.puts(no_msg)
    end
  end
end
