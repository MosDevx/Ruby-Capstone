require_relative 'music_album'
require_relative 'controller'

class MusicAlbumController
  include Controller

  attr_accessor :music_albums

  def initialize
    @music_albums = populate_from_file('albums') || []
  end

  def create_music_album(genre: '')
    puts 'Please enter the following (Album) info: '
    print 'Album Name: '
    album_name = fetch_valid_full_name('Album Name: ')

    print 'Publish Date: '
    publish_date = fetch_valid_date('Publish Date: ')
    print 'Is on Spotify? (y/n): '
    is_on_spotify = fetch_valid_yes_no('Is on Spotify? (y/n): ')

    album = MusicAlbum.new(name: album_name, on_spotify: is_on_spotify, publish_date: publish_date)
    puts '+++ New Album created! +++'
    genre.add_item(album)
    @music_albums << album

    # if new_album?(album_name)
    # 	album = MusicAlbum.new(name: album_name,on_spotify: is_on_spotify, publish_date: publish_date)
    # 	@music_albums << album
    # 	puts '+++ New Album created! +++'
    # 	album
    # else
    # 	puts 'Album already exists!'
    # 	existing_album = @music_albums.find { |alb| alb.to_s == album_name.downcase }
    # 	puts 'Returning existing album...'
    # 	existing_album
    # end
  end

  # def new_album?(album_name)
  # 	@music_albums.each do |album|
  # 		return false if album.to_s == album_name
  # 	end
  # 	true
  # end

  def list_music_albums
    if @music_albums.empty?
      puts '~~~ No Albums Found ~~~'
      puts 'Please create an Album...(8)'
    else
      puts '<<< List Of Albums >>>'
      @music_albums.each do |album|
        puts "Album: #{album.name}"
      end
    end
  end
end
