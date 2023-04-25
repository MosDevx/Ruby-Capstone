require_relative './music_album'
require_relative './genre'
require_relative './game'
require_relative './book'
require_relative './label'
require_relative './author'

class App
    attr_accessor :albums, :genres, :books, :games, :labels, :authors

    def initialize
        @albums = []
        @genres = []
        @books = []
        @games = []
        @labels = []
        @authors = []
    end

    def add_music_album
        puts 'Album title: '
        title = gets.chomp.to_s
        puts 'Publish data: '
        date = gets.chomp.to_s
        puts 'Genre: '
        genre_name = gets.chomp.to_s
        puts 'Is on spotify? [Y/N]: '
        answer = gets.chomp
        on_spotify = true if %w[Y y].include?(answer)
        on_spotify = false if %w[N n].include?(answer)
        puts 'New Music Album created! '

        @albums << MusicAlbum.new(on_spotify, date, title)
        @genres << Genre.new(genre_name)
    end
    
    # def list_music_albums(album)
    #     if @albums.empty?
    #         puts 'Please a music album'
    #     else 
    #         @albums.each do |album|
    #             puts "Title #{album.name}"

end