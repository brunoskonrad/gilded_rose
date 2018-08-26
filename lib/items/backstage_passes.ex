defmodule Item.BackstagePasses do
  def update_item(%Item{name: "Backstage passes", sell_in: sell_in, quality: _quality}) when sell_in <= 0 do
    %Item{name: "Backstage passes", sell_in: sell_in - 1, quality: 0}
  end

  def update_item(%Item{name: "Backstage passes", sell_in: sell_in, quality: quality}) when sell_in > 10 do
    %Item{name: "Backstage passes", sell_in: sell_in - 1, quality: upgrade_quality(quality + 1)}
  end

  def update_item(%Item{name: "Backstage passes", sell_in: sell_in, quality: quality}) when sell_in > 5 do
    %Item{name: "Backstage passes", sell_in: sell_in - 1, quality: upgrade_quality(quality + 2)}
  end

  def update_item(%Item{name: "Backstage passes", sell_in: sell_in, quality: quality}) when sell_in >= 0 do
    %Item{name: "Backstage passes", sell_in: sell_in - 1, quality: upgrade_quality(quality + 3)}
  end

  defp upgrade_quality(quality) when quality > 50, do: 50
  defp upgrade_quality(quality), do: quality
end
