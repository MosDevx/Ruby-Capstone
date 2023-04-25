require_relative 'item'

class Book < Item

	def initialize(publish_date: '', genre: '', label: '', source: '', author: '')
		super(publish_date: publish_date, genre: genre, label: label, source: source, author: author)
	end

end