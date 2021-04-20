require './lib/food_truck'
require './lib/item'
require './lib/event'

RSpec.describe 'Event' do
  describe '#initialize' do
    it 'creates an event' do
      event = Event.new("South Pearl Street Farmers Market")

      expect(event.class).to eq(Event)
      expect(event.name).to eq("South Pearl Street Farmers Market")
    end
  end
end
