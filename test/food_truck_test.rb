require 'minitest/autorun'
require 'minitest/pride'
require './lib/item'
require './lib/food_truck'

class FoodTruckTest < Minitest::Test
  def setup
    @item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
    @item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})
    @food_truck = FoodTruck.new("Rocky Mountain Pies")
  end

  def test_it_exists_and_has_attributes
    assert_instance_of FoodTruck, @food_truck
    assert_equal "Rocky Mountain Pies", @food_truck.name
  end

  def test_it_can_stock_and_check_inventory
    assert_equal Hash.new, @food_truck.inventory

    @food_truck.stock(@item1, 30)
    expected1 = {@item1 => 30}
    assert_equal expected1, @food_truck.inventory
    assert_equal 30, @food_truck.check_stock(@item1)

    @food_truck.stock(@item1, 25)
    assert_equal 55, @food_truck.check_stock(@item1)

    @food_truck.stock(@item2, 12)
    expected2 = {@item1 => 55, @item2 => 12}
    assert_equal expected2, @food_truck.inventory
  end
end
