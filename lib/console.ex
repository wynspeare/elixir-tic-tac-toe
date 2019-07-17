defmodule Console do
  def get_input(message) do
    String.trim(IO.gets(message))
  end

  def display(message) do
    IO.puts(message)
  end
end
