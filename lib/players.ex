# defmodule Players do
#   def build({marker_1, marker_2}) do
#     {Player.build(marker_1), Player.build(marker_2)}
#   end
# end


defmodule Players do
  def build({marker_1, marker_2}) do
    {Player.Human.build(marker_1), Player.Comp.build(marker_2)}
  end

end
