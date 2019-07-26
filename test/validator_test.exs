defmodule ValidatorTest do
  use ExUnit.Case

  test "convert_input converts a string to integer when true is passed in" do
    assert Validator.convert_input({true, "2"}) == 2
  end

  test "a user must enter a number when entering a chosen move" do
    assert Validator.is_numerical_location("2") == {true, "2"}
  end

  test "a user cannot enter a non-numerical character when entering a chosen move" do
    assert Validator.is_numerical_location("n") == {false, "n"}
  end

  test "a user cannot enter an emoji when entering a chosen move" do
    assert Validator.is_numerical_location("🔥") == {false, "🔥"}
  end

  test "a user cannot enter an * when entering a chosen move" do
    assert Validator.is_numerical_location("*") == {false, "*"}
  end

  test "is_valid_move returns tuple with true and integer location if cell is empty" do
    board = [1, 2, "X", 4, 5, "O", "O", "O", 9]
    assert Validator.is_valid_move("2", board) == {true, 2}
  end

  test "is_valid_move returns tuple with false and integer location when a cell is filled" do
    board = [1, 2, "X", 4, 5, "O", "O", "O", 9]
    assert Validator.is_valid_move("3", board) == {false, 3}
  end

  test "is_valid_move return tuple with false and location if a invalid move is entered" do
    board = [1, 2, "X", 4, 5, "O", "O", "O", 9]
    assert Validator.is_valid_move("a", board) == {false, "a"}
  end
end
