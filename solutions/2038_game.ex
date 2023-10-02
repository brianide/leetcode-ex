defmodule Solution do
  @spec winner_of_game(colors :: String.t) :: boolean
  def winner_of_game(colors) do
    String.to_charlist(colors)
    |> Enum.chunk_by(&Function.identity/1)
    |> Enum.map(fn s -> {(if hd(s) == ?A, do: :a, else: :b), length(s)} end)
    |> Enum.filter(fn {_, n} -> n > 2 end)
    |> Enum.reduce(%{a: 0, b: 0}, fn
      {k, v}, acc -> Map.update!(acc, k, &(&1 + v - 2))
    end)
    |> case do
      %{a: a, b: b} when a > b -> true
      _ -> false
    end
  end
end
