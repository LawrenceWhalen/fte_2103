class FoodTruck
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}
  end

  def check_stock(item_instance)
    if @inventory[item_instance].nil?
      0
    else
      @inventory[item_instance]
    end
  end

  def stock(item, amount)
    if @inventory[item].nil?
      @inventory[item] = amount
    else
      @inventory[item] += amount
    end
  end

  def potential_revenue
    @inventory.sum do |item, stock|
      item.price.delete("$").to_f * stock
    end
  end
  def set_stock(item, amount)
    @inventory[item] = amount
  end
end
