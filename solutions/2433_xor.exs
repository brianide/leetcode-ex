defmodule Solution do
  use Bitwise

  @spec find_array(pref :: [integer]) :: [integer]
  def find_array([h | rest]) do
    find_array(rest, h, [h])
  end

  def find_array([], prev, out), do: Enum.reverse(out)

  def find_array([n | rest], prev, out) do
    out = [bxor(prev, n) | out]
    find_array(rest, n, out)
  end
end
