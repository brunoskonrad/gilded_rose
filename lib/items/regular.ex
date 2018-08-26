defmodule Item.Regular do
  def update_item(%Item{name: name, sell_in: sell_in, quality: 0}) do
    %Item{name: name, sell_in: sell_in - 1, quality: 0}
  end

  def update_item(%Item{name: name, sell_in: sell_in, quality: quality}) when sell_in <= 0 do
    %Item{name: name, sell_in: sell_in - 1, quality: upgrade_quality(quality - 2)}
  end

  def update_item(%Item{name: name, sell_in: sell_in, quality: quality}) do
    %Item{name: name, sell_in: sell_in - 1, quality: upgrade_quality(quality - 1)}
  end

  defp upgrade_quality(quality) when quality > 50, do: 50
  defp upgrade_quality(quality), do: quality
end
