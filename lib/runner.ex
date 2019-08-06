defmodule Runner do
  def main(_args) do
    start_game()
  end

  def start_game() do
    Controller.get_input(:start_game)
    |> Configuration.build_game()
  end
end
