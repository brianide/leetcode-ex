defmodule Solution do
  @vowels [?a, ?e, ?i, ?o, ?u, ?A, ?E, ?I, ?O, ?U]

  @spec sort_vowels(s :: String.t) :: String.t
  def sort_vowels(s) do
    chars = String.to_charlist(s)
    pairs =
      Enum.with_index(chars)
      |> Enum.reduce({[], []}, fn {c, i}, {vowels, indices} ->
        if c in @vowels do
          {[c | vowels], [i | indices]}
        else
          {vowels, indices}
        end
      end)
      |> then(fn {vowels, indices} -> Enum.zip(Enum.reverse(indices), Enum.sort(vowels)) end)

    for {i, v} <- pairs, reduce: List.to_tuple(chars) do
      acc -> Kernel.put_elem(acc, i, v)
    end
    |> Tuple.to_list() |> List.to_string()
  end
end
