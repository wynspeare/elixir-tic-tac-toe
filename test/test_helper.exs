ExUnit.start()

defmodule FakeIO do
  def gets("Do you want to play Tic Tac Toe?\n"), do: "Y"
  def gets("Try again.\n"), do: "!"
  def gets("Player X it is your turn. Please select a cell 1 - 9:\n"), do: "1"
end
