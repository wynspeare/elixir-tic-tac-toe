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

    get_markers()
    |> Players.build()
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

  def get_markers() do
    {"X", "O"}
    |> show_markers()
  end

  def show_markers(markers) do
    Messages.get(:show_markers, elem(markers, 0), elem(markers, 1)) |> Console.display()
    markers
  end

  def use_default_markers("Y") do
    {"X", "O"}
    |> show_markers()
  end

  def choose_again() do
    :choose_again |> Messages.get() |> Console.display()
  end
end
