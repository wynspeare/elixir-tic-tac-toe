defmodule Runner do
  def main(_args) do
    start_game()
  end

  def start_game() do
    :start_game
    |> Messages.get()
    |> Console.get_input()
    |> TTT.start_new_game()
    |> begin_game()

    get_markers()
    |> Players.build()
    |> Game.build()
    |> game_loop()
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
  end

  def begin_game("N") do
    :goodbye |> Messages.get() |> Console.display()
  end

  def begin_game(_) do
    choose_again()
    start_game()
  end

  def get_markers() do
    :default_markers
    |> Messages.get()
    |> Console.get_input()
    |> use_default_markers?()
  end

  def use_default_markers?("Y") do
    :show_default_markers |> Messages.get() |> Console.display()
    {"X", "O"}
  end

  def use_default_markers?("N") do
    :get_marker |> Messages.get() |> Console.get_input()
  end

  def use_default_markers?(_) do
    choose_again()
    get_markers()
  end

  def choose_again() do
    :choose_again |> Messages.get() |> Console.display()
  end
end
