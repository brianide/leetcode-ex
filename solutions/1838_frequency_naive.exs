defmodule Solution do
  @spec max_frequency(nums :: [integer], k :: integer) :: integer
  def max_frequency(nums, k) do
    Enum.map(nums, &count_for(nums, &1, k))
    |> Enum.max()
  end

  def count_for(nums, n, k) do
    Enum.map(nums, & n - &1)
    |> Enum.filter(& &1 >= 0)
    |> Enum.sort()
    |> Enum.scan(&Kernel.+/2)
    |> Enum.take_while(& &1 <= k)
    |> Enum.count()
  end
end
