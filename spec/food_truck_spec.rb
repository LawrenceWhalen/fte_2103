require './lib/food_truck'

RSpec.describe 'FoodTruck' do
  describe '#initialize' do
    it 'creates a food truck'
      food_truck = FoodTruck.new('name')

      expect(food_truck.class).to eq(FoodTruck)
    end
    it 'has a name' do
      food_truck = FoodTruck.new('name')

      expect(food_truck.name).to eq('name')
    end
end
