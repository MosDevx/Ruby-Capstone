require_relative 'game'
require_relative 'controller'

class GameController
  include Controller

  attr_accessor :games

  def initialize
    @games = populate_from_file('games') || []
  end

  def create_game(auth: '')
    puts 'Please enter the following (Game) info: '
    print 'Game Name: '
    game_name = fetch_valid_name('Game Name: ')

    print 'Publish Date-(YYYY-MM-DD): '
    publish_date = fetch_valid_date('Publish Date-(YYYY-MM-DD): ')

    print 'Last Played at-(YYYY-MM-DD): '
    last_played_at = fetch_valid_date('Last Played at-(YYYY-MM-DD): ')

    print 'Multiplayer? (y/n): '
    is_multiplayer = fetch_valid_yes_no('Multiplayer? (y/n): ')

    game = Game.new(name: game_name, multiplayer: is_multiplayer,
                    publish_date: publish_date,
                    last_played_at: last_played_at)
    auth.add_item(game)
    puts
    puts '+++ New Game created! +++'
    @games << game
  end

  def list_games
    if @games.empty?
      puts '~~~ No Games Found ~~~'
      puts 'Please create a Game...(9)'
    else
      puts '<<< List Of Games >>>'
      @games.each do |game|
        puts "Game: #{game.name}"
      end
    end
  end
end
