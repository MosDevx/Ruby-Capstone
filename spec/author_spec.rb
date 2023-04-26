require './spec/spec_helper'

describe Author do
  let(:author) { Author.new(first_name: 'Soap', last_name: 'McTavish') }
  let(:author2) { Author.new(first_name: 'Captain', last_name: 'Price') }
  let(:game) do
    Game.new(name: 'Modern Warfare', last_played_at: '2012-01-01', multiplayer: true, publish_date: '2005-02-02')
  end

  describe '#initialize' do
    it 'creates a new author with the given name' do
      expect(author.first_name).to eq('Soap')
      expect(author.last_name).to eq('McTavish')
    end

    it 'creates an empty array of items' do
      expect(author.items).to eq([])
    end

    it 'generates a random id' do
      expect(author.id).not_to be_nil
    end
  end

  describe '#add_item' do
    it 'adds item to items array and sets item to self' do
      author.add_item(game)
      expect(game.author).to eq(author)
      expect(author.items).to include(game)
    end

    it 'raises an error if the item already has an author' do
      author.add_item(game)
      expect { author2.add_item(game) }.to raise_error('Item already has an author')
    end
  end
end
