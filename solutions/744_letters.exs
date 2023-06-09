defmodule Solution do
  @none ?z + 1

  @spec next_greatest_letter(letters :: [char], target :: char) :: char
  def next_greatest_letter(letters, target) do
    Enum.reduce(letters, @none, &(if &1 > target && &1 < &2, do: &1, else: &2))
    |> case do
      @none -> hd(letters)
      m -> m
    end
  end
end
