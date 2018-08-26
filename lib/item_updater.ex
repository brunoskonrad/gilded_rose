defmodule ItemUpdater do
  def get(%Item{name: "Sulfuras", sell_in: _sell_in, quality: _quality}) do
    Item.Sulfuras
  end

  def get(%Item{name: "Aged Brie", sell_in: _sell_in, quality: _quality}) do
    Item.AgedBrie
  end

  def get(%Item{name: "Backstage passes", sell_in: _sell_in, quality: _quality}) do
    Item.BackstagePasses
  end

  def get(%Item{name: "Conjured", sell_in: _sell_in, quality: _quality}) do
    Item.Conjured
  end

  def get(%Item{name: _name, sell_in: _sell_in, quality: _quality}) do
    Item.Regular
  end
end
