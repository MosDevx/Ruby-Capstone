require 'securerandom'

require_relative 'book'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name: '', last_name: '',prev_id: nil,items: nil)
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @id = prev_id || generate_id
    @items = items || []

  end

  def generate_id
    SecureRandom.uuid.delete('-')[0, 8]
  end

  def to_s
    "#{@first_name}#{@last_name}".downcase
  end

  def add_item(item)
    if item.author == self
      nil
    elsif item.author.instance_of?(String) || item.author.nil?
      item.author = self
      @items << item unless @items.include?(item)
    else
      raise 'Item already has an author'
    end
  end

  def to_json_custom(*_args)
    books, games, music_albums = break_up_items
    {
      'first_name' => @first_name,
      'last_name' => @last_name,
      'id' => @id,
      'books' => books.map(&:to_json_custom),
      'games' => games.map(&:to_json_custom),
      'music_albums' => music_albums.map(&:to_json_custom)
    }.to_json
  end

  def self.create_from_json(json_string)
    
    hash = JSON.parse(json_string)
    # puts hash
    first_name = hash['first_name']
    last_name = hash['last_name']
    id = hash['id']
    puts hash['books']
    items = self.reconstitute_items(books: hash['books'], games: hash['games'], music_albums: hash['music_albums'])
    new(prev_id:id ,first_name: first_name, last_name: last_name, items: items)
  end

  def self.reconstitute_items(books: [], games: [], music_albums: [])   

  unless books.empty?  
    books = books.map do |bk|
      book = Book.new
      book.from_json(bk)
      book
    end
  end

    games = nil unless games.map do |gm|
      game = Game.new
      game.from_json(gm)
      game
    end
    music_albums = music_albums.map do |ma|
      music_album = MusicAlbum.new
      music_album.from_json(ma)
      music_album
    end

    books + games + music_albums
  end

  def break_up_items()
    books = []
    games = []
    music_albums = []

    @items.each do |item|
      if item.instance_of?(Book)
        books << item
      elsif item.instance_of?(Game)
        games << item
      elsif item.instance_of?(MusicAlbum)
        music_albums << item
      end
    end

    [books, games, music_albums]
  end
end

book = Book.new(publisher: 'Penguin')
author = Author.new(first_name: 'John', last_name: 'Doe')

author.add_item(book)

my_json = author.to_json_custom
puts{my_json}
auth2 = Author.create_from_json(my_json)
puts auth2.items.first.publisher
puts author.id 
puts auth2.id


