defmodule PlayerTest do
    use ExUnit.Case
    doctest TTT

    test "user can choose default markers" do
        assert Player.set_marker("N", "X") == "X"
    end
end
