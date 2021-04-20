require './lib/food_truck'

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
    it 'returns the amount of the item in inventory' do
      food_truck = FoodTruck.new("Rocky Mountain Pies")

      expect(food_truck.check_stock(item1)).to eq(0)
    end
  end
end
