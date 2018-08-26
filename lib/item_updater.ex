defmodule ItemUpdater do
  def get("Sulfuras"), do: Item.Sulfuras
  def get("Aged Brie"), do: Item.AgedBrie
  def get("Backstage passes"), do: Item.BackstagePasses
  def get("Conjured"), do: Item.Conjured
  def get(_name), do: Item.Regular
end
