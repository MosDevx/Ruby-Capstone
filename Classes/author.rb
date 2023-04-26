require 'securerandom'

class Author
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name: '', last_name: '')
    @first_name = first_name
    @last_name = last_name
    generate_id
    @items = []
  end

  def generate_id
    @id = SecureRandom.uuid.delete('-')[0, 8]
  end

  def add_item(item)
    if item.author == self
      return
    elsif item.author.nil?
      item.author = self
      @items << item unless @items.include?(item)
    else
      raise 'Item already has an author' unless item.author == nil || item.author == self
    end
  end

  private

  attr_reader :item
end
