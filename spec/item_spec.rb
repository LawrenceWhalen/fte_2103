require './lib/item'

RSpec.describe 'Item' do
  describe  '#initialze' do
    it 'creates an item' do
      item = Item.new({})

      expect(item.class).to eq(Item)
    end
    it 'initializes the attribute hash' do
      item = Item.new({name: 'Peach Pie (Slice)', price: "$3.75"})

      expect(item.name).to eq('Peach Pie (Slice)')
      expect(item.price).to eq('$3.75')
    end
  end
end
