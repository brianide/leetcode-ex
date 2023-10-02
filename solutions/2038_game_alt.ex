defmodule Solution do
  @spec winner_of_game(colors :: String.t) :: boolean
  def winner_of_game(colors), do: winner(String.to_charlist(colors), 0, 0)

  def winner([?A, ?A, ?A | _] = chars, a, b), do: winner(tl(chars), a + 1, b)
  def winner([?B, ?B, ?B | _] = chars, a, b), do: winner(tl(chars), a, b + 1)
  def winner([], a, b), do: a > b
  def winner([_ | chars], a, b), do: winner(chars, a, b)
end
