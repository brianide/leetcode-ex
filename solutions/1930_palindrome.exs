defmodule Solution do
  @spec count_palindromic_subsequence(s :: String.t) :: integer
  def count_palindromic_subsequence(s) do
    chars = String.to_charlist(s)

    Stream.with_index(chars)
    |> Enum.reduce(%{}, fn {c, i}, acc ->
      Map.update(acc, c, {i + 1, -1}, &Kernel.put_elem(&1, 1, i))
    end)
    |> Map.values()
    |> Enum.filter(fn {i, j} -> i >= 0 && j >= 0 end)
    |> tap(&IO.inspect/1)
    |> Enum.map(fn {i, j} -> chars |> Enum.drop(i) |> Enum.take(j - i) |> Enum.uniq() |> Enum.count() end)
    |> Enum.sum()
  end
end
