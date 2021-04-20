class Event
  attr_reader :name,
              :food_trucks

  def initialize(name)
    @name = name
    @food_trucks = []
  end

  def add_food_truck(food_truck)
    @food_trucks.push(food_truck)
  end

  def food_truck_names
    @food_trucks.map do |food_truck|
      food_truck.name
    end
  end

  def food_trucks_that_sell(item)
    @food_trucks.find_all do |food_truck|
      food_truck.inventory.keys.include?(item)
    end
  end

  def total_inventory
    @food_trucks.each_with_object({}) do |truck, hash|
      truck.inventory.each do |item, stock|
        if hash[item].nil?
          hash[item] = {quantity: stock, food_trucks: [truck]}
        else
          hash[item][:quantity] += stock
          hash[item][:food_trucks] << truck
        end
      end
    end
  end
end
