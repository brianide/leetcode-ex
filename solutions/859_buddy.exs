defmodule Solution do
  @spec buddy_strings(s :: String.t, goal :: String.t) :: boolean
  def buddy_strings(s, goal) when not is_list(s), do: buddy_strings(to_charlist(s), to_charlist(goal))
  def buddy_strings(s, goal) when length(s) != length(goal), do: false

  def buddy_strings(s, goal) do
    s = to_charlist(s)
    goal = to_charlist(goal)
    diffs = Enum.zip_with([s, goal], fn [a, b] -> {a, b, a - b} end) |> Enum.filter(&(elem(&1, 2) != 0))
    case diffs do
      [] -> Enum.frequencies(s) |> Enum.any?(fn {_, v} -> v >= 2 end)
      [{a, b, _}, {x, y, _}] -> a == y && b == x
      _ -> false
    end
  end
end
