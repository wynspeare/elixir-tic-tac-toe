defmodule Players do
  def build({marker_1, marker_2}) do
    {Human.build(marker_1), Human.build(marker_2)}
  end

  def build({marker_1, marker_2}, single_player) when single_player == true do
    {Human.build(marker_1), Easy_Mode.build(marker_2)}
  end
end
