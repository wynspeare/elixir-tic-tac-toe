defmodule Runner do
  def main(_args) do
    start_game()
  end

  def start_game() do
    :start_game
    |> Messages.get()
    |> Console.get_input()
    |> begin_game()
  end

  def game_loop({true, game}) do
    Console.display_board(game.board)
    :draw |> Messages.get() |> Console.display()
  end

  def game_loop({false, game}) do
    Console.display_board(game.board)
    :winner |> Messages.get(game.current_player.marker) |> Console.display()
  end

  def game_loop(game) do
    Console.display_board(game.board)

    unless Board.is_filled(game.board) do
      TTT.turn(game)
      |> game_loop()
    end
  end

  def begin_game("Y") do
    :welcome |> Messages.get() |> Console.display()

    Options.single_player_game()
    |> Game.build()
    |> game_loop()
  end

  def begin_game("N") do
    :goodbye |> Messages.get() |> Console.display()
  end

  def begin_game(_) do
    choose_again()
    start_game()
  end

  def choose_again() do
    :choose_again |> Messages.get() |> Console.display()
  end
end
