defmodule Item.Regular do
  def update_item(%Item{name: name, sell_in: sell_in, quality: 0}) do
    %Item{name: name, sell_in: sell_in - 1, quality: 0}
  end

  def update_item(%Item{name: name, sell_in: sell_in, quality: quality}) when sell_in <= 0 do
    %Item{name: name, sell_in: sell_in - 1, quality: quality - 2}
  end

  def update_item(%Item{name: name, sell_in: sell_in, quality: quality}) do
    %Item{name: name, sell_in: sell_in - 1, quality: quality - 1}
  end
end
