defmodule Solution do
  @spec check_straight_line(coordinates :: [[integer]]) :: boolean
  def check_straight_line(coordinates) do
    Stream.chunk_every(coordinates, 2, 1, :discard)
    |> Stream.map(fn [[ax, ay], [bx, by]] ->
      case by - ay do
        0 -> nil
        dy -> (bx - ax) / dy
      end
    end)
    |> Stream.chunk_every(2, 1, :discard)
    |> Enum.all?(fn [a, b] -> a == b end)
  end
end
