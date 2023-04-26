require 'securerandom'

class Label

	attr_accessor :title, :color
	def initialize(title:'' ,color:'' )
		@title = title
		@color = color
		@items = []
	end

	def generate_id
		@id = SecureRandom.uuid.delete('-')[0, 8]
	end

	def to_s
		"#{@title} (#{@color})"
	end

	def add_item(item:item)
		@items << Item
		item.label = self
	end

	private
	attr_accessor :id, :items
end