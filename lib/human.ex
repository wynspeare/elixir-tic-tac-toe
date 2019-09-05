defmodule Human do
  defstruct [:marker]

  def build(marker) do
    %Human{marker: marker}
  end

  def get_move(marker, board, io \\ IO) do
    Controller.get_input(:get_move, marker, io)
    |> Validator.is_valid_move(board)
  end
end
