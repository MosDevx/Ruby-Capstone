require_relative './music_album'
require_relative './genre'
require 'json'
# require_relative './item'
# require_relative './game'
# require_relative './author'
# require_relative './data_handler'
require_relative 'book_controller'
# require_relative 'music_album_controller'
require_relative 'author_controller'
require_relative 'label_controller'
require_relative 'genre_controller'
require_relative 'game_controller'
require_relative 'music_controller'

class App
  # attr_accessor :albums, :genres, :games, :authors

  def initialize
    @label_controller = LabelController.new
    @author_controller = AuthorController.new
    @genre_controller = GenreController.new
    @book_controller = BookController.new
    @game_controller = GameController.new
    @music_album_controller = MusicAlbumController.new
  end

  def add_book
    author = @author_controller.create_author
    genre = @genre_controller.create_genre
    label = @label_controller.create_label

    @book_controller.create_book(author: author, genre: genre, label: label)
  end

  def list_books
    @book_controller.list_books
  end

  def add_game
    auth = @author_controller.create_author
    @game_controller.create_game(auth: auth)
  end

  def list_games
    @game_controller.list_games
  end

  def add_music_album
    genre = @genre_controller.create_genre
    @music_album_controller.create_music_album(genre: genre)
  end

  def list_music_albums
    @music_album_controller.list_music_albums
  end

  def list_labels
    @label_controller.list_labels
  end

  def list_genres
    @genre_controller.list_genres
  end

  def list_authors
    @author_controller.list_authors
  end

  def save_data
    FileUtils.mkdir_p('data')

    @book_controller.save_to_file('books', @book_controller.books)
    @label_controller.save_to_file('labels', @label_controller.labels)
    @genre_controller.save_to_file('genres', @genre_controller.genres)
    @author_controller.save_to_file('authors', @author_controller.authors)
    @game_controller.save_to_file('games', @game_controller.games)
    @music_album_controller.save_to_file('albums', @music_album_controller.music_albums)
  end
end
