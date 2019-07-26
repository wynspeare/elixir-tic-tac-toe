defmodule Runner do
  def main(_args) do
    run()
  end

  def run do
    Messages.get(:start_game)
    |> Console.get_input()
    |> run()
  end

  def run("Y") do
    Messages.get(:welcome)
    |> Console.display()

    Players.build()
    |> Game.build()
    |> Game.loop()
  end

  def run(_) do
    Messages.get(:goodbye)
    |> Console.display()
  end
end
