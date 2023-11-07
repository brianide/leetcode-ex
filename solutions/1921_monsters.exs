defmodule Solution do
  @spec eliminate_maximum(dist :: [integer], speed :: [integer]) :: integer
  def eliminate_maximum(dist, speed) do
    Enum.zip(dist, speed)
    |> Enum.map(fn {dist, speed} -> ceil(dist / speed) end)
    |> Enum.sort()
    |> Stream.with_index()
    |> Stream.take_while(fn {t, i} -> t > i end)
    |> Enum.count()
  end
end
