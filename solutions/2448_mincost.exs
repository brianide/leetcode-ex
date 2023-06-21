defmodule Solution do
  @spec min_cost(nums :: [integer], cost :: [integer]) :: integer
  def min_cost(nums, cost) do
    {min, max} = Enum.min_max(nums)
    numcosts = Enum.zip(nums, cost)
    min_cost(numcosts, min, max)
  end

  def min_cost(numcosts, left, right) when left >= right do
    cost_of(numcosts, left)
  end

  def min_cost(numcosts, left, right) do
    IO.puts("#{left} #{right}")
    mid = div(left + right, 2)
    a = cost_of(numcosts, mid)
    b = cost_of(numcosts, mid + 1)

    if a > b do
      min_cost(numcosts, mid + 1, right)
    else
      min_cost(numcosts, left, mid)
    end
  end

  def cost_of(numcosts, n) do
    Enum.map(numcosts, fn {num, cost} ->
      abs(num - n) * cost
    end)
    |> Enum.sum()
  end
end
