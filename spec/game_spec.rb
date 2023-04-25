require './spec/spec_helper'

describe Game do
    let(:game) { Game.new(last_played_at: '2012-01-01', genre: 'RPG', label: 'Modern Warfare', source: 'Steam', publish_date: '2005-02-02') }
    let (:author) { Author.new(first_name: 'Captain', last_name: 'Soap') }

    describe '#initialize' do
        it 'sets the last_played_at, genre, label, source' do
        expect(game.last_played_at).to eq('2012-01-01')
        expect(game.genre).to eq('RPG')
        expect(game.label).to eq('Modern Warfare')
        expect(game.source).to eq('Steam')
        end
    end

    describe '#can_be_archived?' do
        it 'returns true if the game was last played more than 2 years ago' do
        expect(game.can_be_archived?).to eq(true)
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