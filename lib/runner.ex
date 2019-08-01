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

  def single_player_game() do
    :single_player
    |> Messages.get()
    |> Console.get_input()
    |> single_player_game()
  end

  def single_player_game("Y") do
    get_markers()
    |> Players.build(true)
  end

  def single_player_game("N") do
    get_markers()
    |> Players.build()
  end

  def single_player_game(_) do
    choose_again()
    single_player_game()
  end

  def begin_game("Y") do
    :welcome |> Messages.get() |> Console.display()

    single_player_game()
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
    :default_markers
    |> Messages.get()
    |> Console.get_input()
    |> use_default_markers
  end

  def get_markers(marker_1) do
    {marker_1, :get_marker |> Messages.get("Two") |> Console.get_input()}
    |> different_markers?()
    |> show_markers()
  end

  def show_markers(markers) do
    Messages.get(:show_markers, elem(markers, 0), elem(markers, 1)) |> Console.display()
    markers
  end

  def different_markers?({marker_1, marker_2}) do
    if marker_1 == marker_2 do
      :different_markers |> Messages.get() |> Console.display()
      get_markers(marker_1)
    else
      {marker_1, marker_2}
    end
  end

  def use_default_markers("Y") do
    {"X", "O"}
    |> show_markers()
  end

  def use_default_markers("N") do
    :get_marker
    |> Messages.get("One")
    |> Console.get_input()
    |> get_markers
  end

  def use_default_markers(_) do
    choose_again()
    get_markers()
  end

  def choose_again() do
    :choose_again |> Messages.get() |> Console.display()
  end
end
