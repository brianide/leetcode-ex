defmodule Solution do
  @spec largest_altitude(gain :: [integer]) :: integer
  def largest_altitude(gain) do
    [0 | gain]
    |> Enum.scan(&Kernel.+/2)
    |> Enum.max()
  end
end
