require './spec/spec_helper'

describe Game do
  let(:author) { Author.new(first_name: 'Captain', last_name: 'Soap') }
  let(:game) do
    Game.new(last_played_at: '2012-01-01', genre: 'RPG', label: 'Modern Warfare', source: 'Steam',
             publish_date: '2005-02-02')
  end

  describe '#initialize' do
    it 'creates a new author with the given name' do
      expect(author.first_name).to eq('Captain')
      expect(author.last_name).to eq('Soap')
    end

    it 'creates an empty array of items' do
      expect(author.items).to eq([])
    end

    it 'generates a random id' do
      expect(author.id).not_to be_nil
    end
  end

  describe '#add_item' do
    it 'adds the item to the author items' do
      author.add_item(game)
      expect(author.items).to include(game)
    end

    it 'sets the author of the item to self' do
      author.add_item(game)
      expect(game.author).to eq(author)
    end
  end
end
