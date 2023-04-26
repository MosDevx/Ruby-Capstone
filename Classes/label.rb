require 'securerandom'
require_relative 'book'

class Label
  attr_accessor :title, :color

  def initialize(title: '', color: '')
    @title = title
    @color = color
    @items = []
    generate_id
  end

  def to_s
    "Title:#{@title} Color:#{@color}"
  end

  def add_item(item)
    if item.label.instance_of?(Label) && item.label != self
      puts '!! Item already has a different label !!'
    else
      item.label = self
      @items << item
    end
  end

  # private
  attr_accessor :id, :items

  def generate_id
    @id = SecureRandom.uuid.delete('-')[0, 8]
  end
end

