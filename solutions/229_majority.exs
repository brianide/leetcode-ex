defmodule Solution do
  @spec majority_element(nums :: [integer]) :: [integer]
  def majority_element(nums) do
    size = div(length(nums), 3)
    Enum.frequencies(nums)
    |> Enum.filter(fn {_, n} -> n > size end)
    |> Enum.map(fn {k, _} -> k end)
  end
end
