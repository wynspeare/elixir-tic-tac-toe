defmodule Runner do
  alias Console
  alias TTT
  alias Messages

  def main(_args) do
    start_game()
  end

  def start_game() do
    TTT.start_new_game(Console.get_user_input(Messages.get_message(:start_game)))
    |> begin_game?()

    get_markers()
  end

  def begin_game?("Y"), do: Console.display_message(Messages.get_message(:welcome))
  def begin_game?("N"), do: Console.display_message(Messages.get_message(:goodbye))

  def begin_game?(_) do
    Console.display_message(Messages.get_message(:choose_again))
    start_game()
  end

  def get_markers() do
    Console.get_user_input(Messages.get_message(:default_markers))
    |> use_default_markers?()
  end

  def use_default_markers?("Y"),
    do: Console.display_message(Messages.get_message(:show_default_markers))

  def use_default_markers?("N"), do: Console.get_user_input(Messages.get_message(:get_marker))

  def use_default_markers?(_) do
    Console.display_message(Messages.get_message(:choose_again))
    get_markers()
  end
end
