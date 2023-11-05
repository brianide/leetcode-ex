defmodule Solution do
  @spec get_winner(arr :: [integer], k :: integer) :: integer
  def get_winner([first | rest], k) do
    get_winner(first, 0, rest, k)
  end

  def get_winner(prev, score, _, k) when score == k, do: prev
  def get_winner(prev, score, [], k), do: prev
  def get_winner(prev, score, [next | rest], k) when prev > next, do: get_winner(prev, score + 1, rest, k)
  def get_winner(prev, score, [next | rest], k) when prev < next, do: get_winner(next, 1, rest, k)
end
