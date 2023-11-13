defmodule Solution do
  @vowels [?a, ?e, ?i, ?o, ?u, ?A, ?E, ?I, ?O, ?U]

  @spec sort_vowels(s :: String.t) :: String.t
  def sort_vowels(s) do
    chars = String.to_charlist(s)
    {vowels, consonants} =
      Enum.split_with(chars, &(&1 in @vowels))
      |> then(fn {v, c} -> {Enum.sort(v), c} end)
    runs =
      Enum.reduce(chars, {true, [0]}, fn
        e, {vowel?, [count | rest]} when vowel? == (e in @vowels) ->
          {vowel?, [count + 1 | rest]}
        e, {_, counts} ->
          {e in @vowels, [1 | counts]}
      end)
      |> then(fn {_, runs} -> Enum.reverse(runs) end)
    build_string(runs, vowels, consonants)
  end

  defp build_string(runs, vowels, consonants), do: build_string([], :vowel, runs, vowels, consonants)
  defp build_string(chars, _, [], [], []), do: chars |> Enum.reverse() |> List.to_string()

  defp build_string(chars, :vowel, [run | runs], vowels, consonants) do
    {next_vowels, vowels} = Enum.split(vowels, run)
    chars = Enum.reverse(next_vowels) ++ chars
    build_string(chars, :consonant, runs, vowels, consonants)
  end

  defp build_string(chars, :consonant, [run | runs], vowels, consonants) do
    {next_consonants, consonants} = Enum.split(consonants, run)
    chars = Enum.reverse(next_consonants) ++ chars
    build_string(chars, :vowel, runs, vowels, consonants)
  end
end
