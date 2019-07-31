defprotocol Strategy do
  @doc """
  Returns a board location for a player to mark.
  """
  def decide(player, board)
end

defimpl Strategy, for: Easy do
  @doc """
  Get move by randomly selecting space
  """

  def decide(easy, board) do
    easy.marker
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
