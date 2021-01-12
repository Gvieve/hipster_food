class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks << food_truck
  end

  def food_truck_names
    @food_trucks.find_all do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.keys.include?(item)
    end
  end

  def sorted_item_list
    items = []
    @food_trucks.each do |food_truck|
      food_truck.inventory.each do |item|
         items << item.first.name
      end
    end
    items.uniq.sort
  end

  def total_inventory
    all_items = @food_trucks.map do |food_truck|
      food_truck.items
    end

    all_items.each do |item|
      require "pry"; binding.pry
    end
  end
end
