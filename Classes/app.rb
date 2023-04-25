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
end