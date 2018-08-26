defmodule Item.Conjured do
  def update_item(%Item{name: "Conjured", sell_in: sell_in, quality: quality}) do
    %Item{name: "Conjured", sell_in: sell_in - 1, quality: quality - 2}
  end
end
