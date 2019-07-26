defmodule Players do
  def build() do
    Console.display("Player 1––")
    player_1 = Player.build("X")
    Console.display("Player 2––")
    player_2 = Player.build("O")
    {player_1, player_2}
  end
end
