defmodule Options do
  def single_player_game() do
    :single_player
    |> Messages.get()
    |> Console.get_input()
    |> single_player_game()
  end

  def single_player_game("Y") do
    Options.get_markers()
    |> Players.build(true)
  end

  def single_player_game("N") do
    Options.get_markers()
    |> Players.build()
  end

  def single_player_game(_) do
    Runner.choose_again()
    single_player_game()
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
    Runner.choose_again()
    get_markers()
  end
end
