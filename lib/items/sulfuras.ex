defmodule Item.Sulfuras do
  def update_item(%Item{name: "Sulfuras", sell_in: sell_in, quality: quality}) do
    %Item{name: "Sulfuras", sell_in: sell_in, quality: upgrade_quality(quality)}
  end

  defp upgrade_quality(quality) when quality > 50, do: 50
  defp upgrade_quality(quality), do: quality
end
