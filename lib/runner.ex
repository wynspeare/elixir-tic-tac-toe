defmodule Runner do
  alias Console
  alias TTT

  def main(_args) do
    TTT.start_new_game(Console.get_user_input())
  end
end
