require './spec/spec_helper'

describe Game do
  let(:game) do
    Game.new(name: 'Modern Warfare', last_played_at: '2012-01-01', multiplayer: true, publish_date: '2005-02-02')
  end
  let(:author) { Author.new(first_name: 'Captain', last_name: 'Soap') }

  describe '#initialize' do
    it 'sets the last_played_at, name, multiplayer, publish_date' do
      expect(game.last_played_at).to eq('2012-01-01')
      expect(game.name).to eq('Modern Warfare')
      expect(game.multiplayer).to eq(true)
      expect(game.publish_date).to eq('2005-02-02')
    end
  end

  describe '#can_be_archived?' do
    it 'returns true if the game was last played more than 2 years ago' do
      expect(game.send(:can_be_archived?)).to eq(true)
    end
  end

  describe 'moving to archive' do
    it 'sets the archived attribute to true' do
      game.move_to_archive
      expect(game.archived).to eq(true)
    end
  end

  describe '#author=' do
    it 'sets the author' do
      game.author = author
      expect(game.author).to eq(author)
    end
    it 'adds the game to the author items' do
      game.author = author
      expect(author.items).to include(game)
    end
  end
end
