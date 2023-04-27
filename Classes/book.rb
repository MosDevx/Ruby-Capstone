require_relative 'item'
require 'json'
class Book < Item
  attr_accessor :publisher, :cover_state, :title

  def initialize(title: '', publisher: '', cover_state: '', item_init: {})
    @publisher = publisher
    @cover_state = cover_state
    @title = title
    super(**item_init)
  end

  private

  def can_be_archived?
    super() || @cover_state == 'bad'
  end
end

bk = Book.new(publisher: 'test', cover_state: 'bad', item_init: { author: 'test', genre: 'test', label: 'test' })
