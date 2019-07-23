defmodule ValidatorTest do
  use ExUnit.Case

  test "convert_input converts a string to integer when true is passed in" do
    assert Validator.convert_input("2") == 2
  end

  test "a user must enter a number when entering a chosen move location" do
    assert Validator.is_numerical_location("2") == {true, "2"}
  end

  test "a user cannot enter a non-numerical charactor when entering a chosen move location" do
    assert Validator.is_numerical_location("n") == {false, "n"}
  end
end
