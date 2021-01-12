class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def stock(item, quantity)
    if @inventory[item].nil?
      @inventory[item] = quantity
    else
      @inventory[item] = (quantity + @inventory[item])
    end
  end

  def check_stock(item)
    @inventory[item]
  end

  def potential_revenue
    @inventory.map do |item, qty|
      (item.price * qty)
    end.sum
  end
end
