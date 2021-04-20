require './lib/food_truck'

RSpec.describe 'FoodTruck' do
  describe '#initialize' do
    food_truck = FoodTruck.new('name')

    expect(food_truck.class).to eq(FoodTruck)
  end
end
