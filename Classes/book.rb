require_relative 'item'

class Book < Item
	attr_accessor :publisher, :cover_state

	def initialize(publish_date: '', genre: '', label: '', source: '', author: '', publisher: '', cover_state: '')
		@publisher = publisher
		@cover_state = cover_state
		super(publish_date: publish_date, genre: genre, label: label, source: source, author: author)
	end

	def can_be_archived?
		super() || @cover_state == 'bad'
	end
end

bk = Book.new(publish_date: '2020-10-10', genre: 'Horror', label: 'The Shining', source: 'Library', author: 'Stephen King', publisher: 'Penguin', cover_state: 'bad')

puts bk.can_be_archived?