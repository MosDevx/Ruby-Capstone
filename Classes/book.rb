require_relative 'item'

class Book < Item
  attr_accessor :publisher, :cover_state

  def initialize(publisher: '', cover_state: '', item_init: {})
    @publisher = publisher
    @cover_state = cover_state
    super(**item_init)
  end

  def can_be_archived?
    super() || @cover_state == 'bad'
  end
end

bk = Book.new(publisher: 'OReilly', cover_state: 'good',
              item_init: { publish_date: '2019-01-01', genre: 'IT', label: 'Ruby',
                           source: 'Internet', author: 'John Doe' })
puts bk.publish_date
