defmodule Game do
  defstruct board: nil,
            player_one: nil,
            player_two: nil,
            current_player: nil

  def build({player_1, player_2}) do
    %Game{
      board: [1, 2, 3, 4, 5, 6, 7, 8, 9],
      player_one: player_1,
      player_two: player_2,
      current_player: player_1
    }
  end
end
