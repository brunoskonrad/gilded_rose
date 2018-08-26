defmodule ItemUpdater do
  def get("Sulfuras") do
    Item.Sulfuras
  end

  def get("Aged Brie") do
    Item.AgedBrie
  end

  def get("Backstage passes") do
    Item.BackstagePasses
  end

  def get("Conjured") do
    Item.Conjured
  end

  def get(_name) do
    Item.Regular
  end
end
