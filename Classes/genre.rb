require_relative 'json_helper'

class Genre
  include JsonHelper
  attr_reader :id, :name, :items

  def initialize(name:'')
    @id = Random.rand(1..1000)
    @name = name.capitalize
    @items = []
  end

  def to_s
    @name.downcase
  end

  def add_item(item)
    @items.push(item)
    item.add_genre = self
  end
end
