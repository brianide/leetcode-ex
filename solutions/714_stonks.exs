defmodule Solution do
  @spec max_profit(prices :: [integer], fee :: integer) :: integer
  def max_profit(prices, fee) do
    Enum.reduce(prices, nil, fn
      price, nil ->
        {-price, 0}
      price, {max_none, max_some} ->
        {
          max(max_none, max_some - price),
          max(max_some, max_none + price - fee)
        }
    end)
    |> elem(1)
  end
end
