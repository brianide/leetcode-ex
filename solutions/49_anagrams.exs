defmodule Solution do
  @spec group_anagrams(strs :: [String.t]) :: [[String.t]]
  def group_anagrams(strs) do
    Enum.group_by(strs, &get_key/1)
    |> Enum.map(&elem(&1, 1))
  end

  def get_key(s), do: String.to_charlist(s) |> Enum.sort()
end
