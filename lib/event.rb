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

  def overstocked_items
    offending_items = total_inventory.find_all do |(item, inventory_status)|
      inventory_status[:quantity] > 50 && inventory_status[:food_trucks].length > 1
    end
    offending_items.map do |(item, inventory_status)|
      item
    end
  end

  def sorted_item_list
    @food_trucks.each_with_object([]) do |truck, array|
      truck.inventory.each do |item, quantity|
        array << item.name
      end
    end.uniq.sort
  end

  def sell(item, amount)
    if total_inventory[item][:quantity] < amount
      false
    else
      while amount > 0
        food_trucks_that_sell(item).each do |truck|
          if truck.check_stock(item) > amount
            truck.set_stock(item, truck.check_stock(item) - amount)
            amount = 0
          else
            amount = (amount - truck.check_stock(item))
            truck.set_stock(item, 0)
          end
        end
      end
      true
    end
  end
end
