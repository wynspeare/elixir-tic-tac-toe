defprotocol Strategy do
  @doc """
  Returns a board location for a player to mark.
  """
  def decide(player, board)
end

defimpl Strategy, for: Easy_Mode do
  @doc """
  Gets move by randomly selecting move from available cells
  """

  def decide(easy_mode, board) do
    easy_mode.marker
    |> Easy_Mode.get_random_move(board)
  end
end

defimpl Strategy, for: Human do
  @doc """
  Gets move from console
  """
  def decide(human, board) do
    human.marker
    |> Human.get_move(board)
  end
end