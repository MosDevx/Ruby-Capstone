require 'securerandom'
require_relative 'book'

class Label

	attr_accessor :title, :color
	def initialize(title:'' ,color:'' )
		@title = title
		@color = color
		@items = []
		generate_id
	end



	def to_s
		"Title:#{@title} Color:#{@color}"
	end

	def add_item(item)
		item.label = self
		@items << item
	end

	private
	attr_accessor :id, :items

	def generate_id
		@id = SecureRandom.uuid.delete('-')[0, 8]
	end
end

lb = Label.new(title:'test', color:'red')
lb.add_item(Book.new(publisher:'test', cover_state:'test', item_init:{publish_date:'2010-10-10', genre:'test', label:lb, source:'test', author:'test'}))
puts lb.items[0].label