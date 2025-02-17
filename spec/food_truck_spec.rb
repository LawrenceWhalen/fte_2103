require './lib/food_truck'
require './lib/item'

RSpec.describe 'FoodTruck' do
  describe '#initialize' do
    it 'creates a food truck' do
      food_truck = FoodTruck.new('name')

      expect(food_truck.class).to eq(FoodTruck)
    end
    it 'has a name and no inventory' do
      food_truck = FoodTruck.new('name')

      expect(food_truck.name).to eq('name')
      expect(food_truck.inventory).to eq({})
    end
  end
  describe '#check_stock' do
    it 'returns the amount of the item in inventory, default 0' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end
  describe '#stock' do
    it 'adds an item and a number to inventory hash' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      food_truck.stock(item1, 30)

      expect(food_truck.check_stock(item1)).to eq(30)
    end
  end
  it 'adds to the number of items if already stocked' do
    food_truck = FoodTruck.new("Rocky Mountain Pies")
    item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

    food_truck.stock(item1, 30)
    food_truck.stock(item1, 25)

    expect(food_truck.check_stock(item1)).to eq(55)
  end
  describe '#potential_revenue' do
    it 'returns the maximum revenue a truck could produce' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")
      item1 = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})
      item2 = Item.new({name: 'Apple Pie (Slice)', price: '$2.50'})

      food_truck.stock(item1, 30)
      food_truck.stock(item2, 25)

      expect(food_truck.potential_revenue).to eq(175.0)
    end
  end
end
