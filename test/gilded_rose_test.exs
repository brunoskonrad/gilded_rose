defmodule GildedRoseTest do
  use ExUnit.Case

  describe "when regular item" do
    test "decreses quality and sell_in" do
      fixture = [%Item{name: "Regular item", sell_in: 9, quality: 10}]
      expected = [%Item{name: "Regular item", sell_in: 8, quality: 9}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't decrease quality if it is already 0 when sell_in is positive" do
      fixture = [%Item{name: "Regular item", sell_in: 9, quality: 0}]
      expected = [%Item{name: "Regular item", sell_in: 8, quality: 0}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't decrease quality if it is already 0 when sell_in is 0 or less" do
      fixture = [%Item{name: "Regular item", sell_in: 0, quality: 0}]
      expected = [%Item{name: "Regular item", sell_in: -1, quality: 0}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "quality decreases by 2 when sell_in is 0 or less" do
      fixture = [%Item{name: "Regular item", sell_in: 0, quality: 5}]
      expected = [%Item{name: "Regular item", sell_in: -1, quality: 3}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end

  describe "when item is 'Sulfuras'" do
    test "doesn't change" do
      fixture = [%Item{name: "Sulfuras", sell_in: 9, quality: 10}]
      expected = [%Item{name: "Sulfuras", sell_in: 9, quality: 10}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't change when sell_in is negative" do
      fixture = [%Item{name: "Sulfuras", sell_in: -1, quality: 10}]
      expected = [%Item{name: "Sulfuras", sell_in: -1, quality: 10}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end

  describe "when item is 'Aged Brie'" do
    test "increases quality by 1" do
      fixture = [%Item{name: "Aged Brie", sell_in: 9, quality: 1}]
      expected = [%Item{name: "Aged Brie", sell_in: 8, quality: 2}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "increases quality by 2 when sell_in is less than 0" do
      fixture = [%Item{name: "Aged Brie", sell_in: 0, quality: 5}]
      expected = [%Item{name: "Aged Brie", sell_in: -1, quality: 7}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't increases quality by 2 when sell_in is less than 0 if quality is 50" do
      fixture = [%Item{name: "Aged Brie", sell_in: 0, quality: 49}]
      expected = [%Item{name: "Aged Brie", sell_in: -1, quality: 50}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end

  describe "when item is 'Backstage passes'" do
    test "increases quality by 2 when sell_in is 10 days or less" do
      fixture = [%Item{name: "Backstage passes", sell_in: 9, quality: 1}]
      expected = [%Item{name: "Backstage passes", sell_in: 8, quality: 3}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "increases quality by 3 when sell_in is 5 days or less" do
      fixture = [%Item{name: "Backstage passes", sell_in: 5, quality: 7}]
      expected = [%Item{name: "Backstage passes", sell_in: 4, quality: 10}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "quality drops to 0 after the concert" do
      fixture = [%Item{name: "Backstage passes", sell_in: 0, quality: 40}]
      expected = [%Item{name: "Backstage passes", sell_in: -1, quality: 0}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "increases quality by one when sell_in is more than 11" do
      fixture = [%Item{name: "Backstage passes", sell_in: 11, quality: 5}]
      expected = [%Item{name: "Backstage passes", sell_in: 10, quality: 6}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't increase quality if it is 50" do
      fixture = [%Item{name: "Backstage passes", sell_in: 5, quality: 50}]
      expected = [%Item{name: "Backstage passes", sell_in: 4, quality: 50}]

      assert GildedRose.update_quality(fixture) == expected
    end

    test "doesn't increase quality over 50" do
      fixture = [%Item{name: "Backstage passes", sell_in: 5, quality: 49}]
      expected = [%Item{name: "Backstage passes", sell_in: 4, quality: 50}]

      assert GildedRose.update_quality(fixture) == expected
    end
  end
end
