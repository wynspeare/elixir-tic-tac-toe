defmodule Runner do
  # use Application
  alias Console
  alias TTT

  def start(_type, _args) do
    Task.start(fn -> TTT.start_new_game(Console.get_user_input()); end)
  end
end
