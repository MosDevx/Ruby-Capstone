require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher: '', cover_state: '', item_init: {})
    @publisher = publisher
    @cover_state = cover_state
    super(**item_init)
  end

  private

  def can_be_archived?
    super() || @cover_state == 'bad'
  end
end

bk = Book.new(title: 'The Hobbit', author: 'J.R.R. Tolkien', genre: 'Fantasy', label: 'Fantasy', publisher: 'Allen & Unwin', cover_state: 'good')

bk =
