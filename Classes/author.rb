require 'securerandom'

require_relative 'book'
require_relative 'label'
require_relative 'game'
require_relative 'json_helper'

class Author
  include JsonHelper
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

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

  # private

  # attr_accessor :items
end

# book = Book.new(publisher: 'Penguin')
# game = Game.new(name: 'Fifa', last_played_at: '2019-01-01', multiplayer: true)
# game2 = Game.new(name: 'PES', last_played_at: '2019-01-01', multiplayer: true)
# book2 = Book.new(publisher: 'Pen')
# author = Author.new(first_name: 'John', last_name: 'Doe')

# author.add_item(book)
# author.add_item(game)
# author.add_item(game2)
# # author.add_item(book2)

# # author.test

# my_json = author.to_json_custom
# # puts my_json
# auth2 = Author.new
# auth2.from_json(my_json)
# # puts auth2.items.last.publisher
# puts author.id
# puts auth2.id

# puts auth2.items[2].name
# puts author.items[2].name
