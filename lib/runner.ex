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
    new_game = TTT.set_markers({"X", "O"})

    IO.puts(new_game.player_one)

    board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    Console.display_board(board)

    TTT.turn(new_game.player_one, board)
    |> Console.display_board()
  end

  def begin_game("Y"), do: :welcome |> Messages.get() |> Console.display()
  def begin_game("N"), do: :goodbye |> Messages.get() |> Console.display()

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

  def use_default_markers?("Y"), do: :show_default_markers |> Messages.get() |> Console.display()

  def use_default_markers?("N"), do: :get_marker |> Messages.get() |> Console.get_input()

  def use_default_markers?(_) do
    choose_again()
    get_markers()
  end

  def choose_again(), do: :choose_again |> Messages.get() |> Console.display()
end
