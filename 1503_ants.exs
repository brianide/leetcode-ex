defmodule Solution do
  @spec get_last_moment(n :: integer, left :: [integer], right :: [integer]) :: integer
  def get_last_moment(n, left, right) do
    max(n - Enum.min(right, fn -> n end), Enum.max(left, fn -> 0 end))
  end
end
