require_relative 'genre'

class GenreController
  def initialize
    @genres = []
  end

  def create_genre
    puts 'Please enter the following information: '
    print 'Genre: '
    genre_name = gets.chomp.to_s

    if new_genre?(genre_name)
      genre = Genre.new(genre_name)
      @genres << genre
      puts 'New Genre created!'
      genre
    else
      puts 'Genre already exists!'
      existing_genre = @genres.find {	|gen| gen.to_s == genre_name.downcase }
      puts 'Returning existing genre...'
      existing_genre
    end
  end

  def new_genre?(genre_name)
    @genres.each do |genre|
      return false if genre.to_s == genre_name
    end
    true
  end

  def list_genres
    if @genres.empty?
      puts 'Please create a genre'
    else
      puts '<<Genres: >>'
      @genres.each do |genre|
        puts "Genre: #{genre.name}"
      end
    end
  end
end
