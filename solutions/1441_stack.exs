defmodule Solution do
  @spec build_array(target :: [integer], n :: integer) :: [String.t]
  def build_array(target, _) do
    build_array(target, [], 1)
  end

  def build_array([], ops, _), do: Enum.reverse(ops)
  def build_array([next | rest], ops, n) when n == next, do: build_array(rest, ["Push" | ops], n + 1)
  def build_array(targ, ops, n), do: build_array(targ, ["Pop", "Push" | ops], n + 1)
end
