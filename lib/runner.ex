defmodule Runner do
  alias Console
  alias TTT
  alias Messages

  def main(_args) do
    start_game()
  end

  def start_game() do
    user_input = TTT.start_new_game(Console.get_user_input(Messages.get_message(:start_game)))

    if user_input == false do
      Console.display_message(Messages.get_message(:choose_again))
      start_game()
    else
      Console.display_welcome(
        user_input,
        Messages.get_message(:welcome),
        Messages.get_message(:goodbye)
      )
    end
  end
end

# def main(_args) do
#   TTT.start_new_game(Console.get_user_input())
#   |> Validator.check_user_input()
#   |> Console.display_welcome()
# end
