defmodule ValidatorTest do
  use ExUnit.Case

  test "convert_input converts a string to integer when true is passed in" do
    assert Validator.convert_input({true, "2"}) == 2
  end

  test "a user must enter a number when entering a chosen move location" do
    assert Validator.is_numerical_location("2") == {true, "2"}
  end

  test "a user cannot enter a non-numerical charactor when entering a chosen move location" do
    assert Validator.is_numerical_location("n") == {false, "n"}
  end

  test "is_valid_move checks if a provided character is numerical and an empty cell on the board, return tuple with true and cell and location" do
    board = [1, 2, "X", 4, 5, "O", "O", "O", 9]
    assert Validator.is_valid_move("2", board) == {true, 2}
  end
end
