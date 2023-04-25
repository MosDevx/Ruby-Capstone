require_relative 'item'

class Book < Item
	attr_accessor :publisher, :cover_state

	def initialize(publish_date: '', genre: '', label: '', source: '', author: '', publisher: '', cover_state: '')
		@publisher = publisher
		@cover_state = cover_state
		super(publish_date: publish_date, genre: genre, label: label, source: source, author: author)
	end

end