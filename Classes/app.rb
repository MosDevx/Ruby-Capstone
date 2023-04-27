require_relative './music_album'
require_relative './genre'
require 'json'

class App
  attr_accessor :albums, :genres,

  def initialize
    @albums = []
    @genres = []
    @label_controller = LabelController.new
    @author_controller = AuthorController.new
   
  end
  
  def list_books
  end

  def add_book
  end

  def add_music_album
    puts 'Album title: '
    name = gets.chomp.to_s
    puts 'Publish data: '
    date = gets.chomp.to_s
    puts 'Genre: '
    genre_name = gets.chomp.to_s
    puts 'Is on spotify? [Y/N]: '
    answer = gets.chomp
    on_spotify = true if %w[Y y].include?(answer)
    on_spotify = false if %w[N n].include?(answer)
    puts 'New Music Album created! '

    album = MusicAlbum.new(name: name, on_spotify: on_spotify, publish_date: date)
    genre = Genre.new(genre_name)
    genre.add_item(album)

    @albums.push({ 'Title' => album.name, 'Publish_date' => album.publish_date, 'Is on spotify?' => album.on_spotify,
                   'Genre' => genre.name })
    @genres.push({ 'Genre' => genre.name })
  end

  def list_music_albums
    if @albums.empty?
      puts 'Please a music album'
    else
      @albums.each do |album|
        puts "Title: \"#{album.name}\", Publish_date: #{album.publish_date}, Is on spotify?: #{album.on_spotify}"
      end
    end
  end

  def list_genres
    if @genres.empty?
      puts 'Please a music album'
    else
      @genres.each { |genre| puts "Genre: \"#{genre.name}\"" }
    end
  end

  def read_file(file)
    read_file = File.read(file)
    JSON.parse(read_file)
  end

  def load_data
    @albums = File.exist?('./data/albums.json') ? read_file('./data/albums.json') : []
    @genres = File.exist?('./data/genre.json') ? read_file('./data/genre.json') : []
  end

  def save_data
    File.write('./data/albums.json', JSON.pretty_generate(@albums))
    File.write('./data/genre.json', JSON.pretty_generate(@genres))
  end
end
