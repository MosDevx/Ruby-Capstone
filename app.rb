require './Classes/item'
require './Classes/game'
require './Classes/author'

class App
  def initialize
    @authors = []
    @games = []
  end

  def list_games
    @games.each_with_index do |game, index|
      puts "#{index}) Name: #{game.name} -" \
           "Author: #{game.author.first_name} #{game.author.last_name} - Last played at: #{game.last_played_at}"
    end
  end

  def list_authors
    @authors.each_with_index do |author, index|
      puts "#{index}) Name: #{author.first_name} #{author.last_name}"
    end
  end

  def add_game
    puts 'Enter the game name:'
    name = gets.chomp
    puts 'Last played at(YYYY-MM-DD):'
    last_played_at = gets.chomp
    puts 'Multiplayer(T/F):'
    choice1 = gets.chomp.upcase
    if choice1 == 'T'
      multiplayer = true
    elsif choice1 == 'F'
      multiplayer = false
    else
      puts 'Invalid option, please type T or F'
      return
    end
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
    game.author = author
    @authors << author
    puts 'Game added successfully'
  end
end
