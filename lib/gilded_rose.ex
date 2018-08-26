defmodule GildedRose do
  # Example
  # update_quality([%Item{name: "Backstage passes", sell_in: 9, quality: 1}])
  # => [%Item{name: "Backstage passes", sell_in: 8, quality: 3}]

  def update_quality(items) do
    Enum.map(items, &update_item/1)
  end

  def update_item(item) do
    updater = ItemUpdater.get(item)

    updater.update_item(item)
  end
end
