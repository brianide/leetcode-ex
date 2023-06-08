defmodule Solution do
  @spec top_k_frequent(nums :: [integer], k :: integer) :: [integer]
  def top_k_frequent(nums, k) do
    freqs = Enum.reduce(nums, %{}, &Map.update(&2, &1, 0, fn n -> n + 1 end))
    Map.keys(freqs) |> Enum.sort_by(&Map.get(freqs, &1), :desc) |> Enum.take(k)
  end
end
