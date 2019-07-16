defmodule Console do
  def get_user_input(message) do
    String.trim(IO.gets(message))
  end

  def display_message(message) do
    IO.puts(message)
  end

  def display_welcome(user_answer, welcome_msg, goodbye_msg) do
    if user_answer == "Y" do
      IO.puts(welcome_msg)
    else
      IO.puts(goodbye_msg)
    end
  end
end
