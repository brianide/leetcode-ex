defmodule Solution do
  @spec first_palindrome(words :: [String.t]) :: String.t
  def first_palindrome(words) do
    Enum.find(words, "", &(&1 == String.reverse(&1)))
  end
end
