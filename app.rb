require './Classes/item'
require './Classes/game'
require './Classes/author'

class App
  def initialize
    @authors = []
    @games = []
  end

  def list_games
    if @games.empty?
      puts 'No games in the library'
    else
      @games.each_with_index do |game, index|
        puts "#{index}) Name: #{game.name} - Mutliplayer: #{game.multiplayer}\n" \
             "Last played at: #{game.last_played_at}\n" \
             "Publish date: #{game.publish_date}"
      end
    end
  end

  def list_authors
    if @authors.empty?
      puts 'No authors in the library'
    else
      @authors.each_with_index do |author, index|
        puts "#{index}) Name: #{author.first_name} #{author.last_name}"
      end
    end
  end

  def add_game
    puts 'Enter the game name:'
    name = gets.chomp
    puts 'Last played at(YYYY-MM-DD):'
    last_played_at = gets.chomp
    multiplayer = multi_player?
    puts 'Publish date(YYYY-MM-DD):'
    publish_date = gets.chomp
    puts 'Author(first name):'
    first_name = gets.chomp
    puts 'Author(last name):'
    last_name = gets.chomp
    game = Game.new(name: name, last_played_at: last_played_at, publish_date: publish_date,
                    multiplayer: multiplayer)
    @games << game
    author = Author.new(first_name: first_name, last_name: last_name)
    author.add_item(game)
    @authors << author
    puts 'Game added successfully'
  end

  def multi_player?
    loop do
      puts 'Multiplayer(T/F):'
      choice1 = gets.chomp.upcase
      if choice1 == 'T'
        return true
      elsif choice1 == 'F'
        return false
      else
        puts 'Invalid option, please type T or F'
      end
    end
  end
end
