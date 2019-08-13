defprotocol Strategy do
  @doc """
  Returns a board location for a player to mark.
  """
  def decide(player, game)
end

defimpl Strategy, for: Easy_Mode do
  @doc """
  Gets move by randomly selecting move from available cells
  """

  def decide(easy_mode, game) do
    easy_mode.marker
    |> Easy_Mode.get_random_move(game.board)
  end
end

defimpl Strategy, for: Human do
  @doc """
  Gets move from console
  """
  def decide(human, game) do
    human.marker
    |> Human.get_move(game.board)


  end
end

defimpl Strategy, for: Hard_Mode do
  @doc """
  Gets move by selecting best move from available cells
  """

  def decide(_, game) do
    Hard_Mode.get_best_move(game)
  end
end
