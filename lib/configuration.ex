defmodule Configuration do
  def build_game("Y") do
    :welcome |> Messages.get() |> Console.display()

    single_player_game()
    |> Game.build()
    |> Controller.game_loop()
  end

  def build_game("N") do
    :goodbye |> Messages.get() |> Console.display()
  end

  def build_game(_) do
    choose_again()
    Runner.start_game()
  end

  def choose_again() do
    :choose_again |> Messages.get() |> Console.display()
  end

  def hard_mode_game() do
    :hard_mode
    |> Messages.get()
    |> Console.get_input()
    |> hard_mode_game()
  end

  def hard_mode_game("Y") do
    :display_mode |> Messages.get("HARD") |> Console.display()

    get_markers()
    |> Players.build(true)
  end

  def hard_mode_game("N") do
    :display_mode |> Messages.get("EASY") |> Console.display()

    get_markers()
    |> Players.build(false)
  end

  def single_player_game() do
    :single_player
    |> Messages.get()
    |> Console.get_input()
    |> single_player_game()
  end

  def single_player_game("Y") do
    hard_mode_game()
  end

  def single_player_game("N") do
    get_markers()
    |> Players.build()
  end

  def single_player_game(_) do
    choose_again()
    single_player_game()
  end

  def get_markers() do
    :custom_markers
    |> Messages.get()
    |> Console.get_input()
    |> use_custom_markers
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

  def use_custom_markers("N") do
    {"X", "O"}
    |> show_markers()
  end

  def use_custom_markers("Y") do
    :get_marker
    |> Messages.get("One")
    |> Console.get_input()
    |> get_markers
  end

  def use_custom_markers(_) do
    choose_again()
    get_markers()
  end
end
