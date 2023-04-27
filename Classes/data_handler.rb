require 'json'

def load_authors
  if File.exist?('./data/authors.json')
    authors_data = read_file('./data/authors.json')
    @authors = []
    unless authors_data.empty?
      authors_data.each do |author_data|
        author = Author.new(first_name: author_data['first_name'], last_name: author_data['last_name'])
        author_data['items']&.each do |item_data|
          item_class = item_data['class']
          item = classer(item_class, item_data)
          author.add_item(item)
        end
        @authors << author
      end
    end
  else
    @authors = []
  end
end

def classer(item_class, item_data)
  case item_class
  when 'Game'
    Game.new(name: item_data['name'],
             multiplayer: item_data['multiplayer'],
             last_played_at: item_data['last_played_at'],
             publish_date: item_data['publish_date'])
  when 'MusicAlbum'
    MusicAlbum.new(name: item_data['name'], on_spotify: item_data['on_spotify'],
                   publish_date: item_data['publish_date'])
  end
end

def load_games
  if File.exist?('./data/games.json')
    games_data = read_file('./data/games.json')
    @games = []
    unless games_data.empty?
      games_data.each do |game_data|
        game = Game.new(name: game_data['name'], multiplayer: game_data['multiplayer'],
                        last_played_at: game_data['last_played_at'],
                        publish_date: game_data['publish_date'])
        @games << game
      end
    end
  else
    @games = []
  end
end
