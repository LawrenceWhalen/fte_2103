require './lib/item'

RSpec.describe 'Item' do
  describe  '#initialze' do
    it 'creates an item' do
      item = Item.new({})

      expect(item.class).to eq(Item)
    end
  end
end
