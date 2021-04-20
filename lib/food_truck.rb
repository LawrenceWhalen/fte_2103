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
end
