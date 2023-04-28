require 'securerandom'

require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'from_json_helper'

class Author
  include FromJsonHelper
  attr_reader :id
  attr_accessor :first_name, :last_name,:items

  def initialize(first_name: '', last_name: '')
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    generate_id
    @items = []
  end

  def generate_id
    @id = SecureRandom.uuid.delete('-')[0, 8]
  end

  def to_s
    "#{@first_name} #{@last_name}"
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
    my_hash ={}

    instance_variables.each do |var|
      unless instance_variable_get(var).kind_of?(Array)
        my_hash[var] = instance_variable_get(var)
      else
        my_hash[var] = breaker(instance_variable_get(var))
      end

    end
    my_hash.to_json

  end

  def from_json(json_string)
    hash = JSON.parse(json_string, create_additions: true)

    hash.each do |var, val|
      unless val.kind_of?(Hash)
        instance_variable_set var, val
      else
        instance_variable_set var, uniter(val)
      end
    end

    # puts hash
    # first_name = hash['first_name']
    # last_name = hash['last_name']
    # id = hash['id']
    # # puts hash['items'].class
    # items = uniter(hash['items'])
    # # puts hash['books']
    # # items = gather_items(books: hash['books'], games: hash['games'], music_albums: hash['music_albums'])
    # @first_name = first_name
    # @last_name = last_name
    # @id = id
    # @items = items
  end

  def test
    breaker(@items)
    # puts hey
    nil
  end

  # private

  # attr_accessor :items
end

book = Book.new(publisher: 'Penguin')
game = Game.new(name: 'Fifa', last_played_at: '2019-01-01', multiplayer: true)
game2 = Game.new(name: 'PES', last_played_at: '2019-01-01', multiplayer: true)
book2 = Book.new(publisher: 'Pen')
author = Author.new(first_name: 'John', last_name: 'Doe')

author.add_item(book)
author.add_item(game)
author.add_item(game2)
# author.add_item(book2)

# author.test

my_json = author.to_json_custom
# puts my_json
auth2 = Author.new
auth2.from_json(my_json)
# puts auth2.items.last.publisher
puts author.id
puts auth2.id

puts auth2.items[2].name
puts author.items[2].name
