require 'securerandom'
class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date: '')
    @publish_date = publish_date
		generate_id
  end

  def call_me()
    puts 'hey'
  end

	def generate_id
		@id = SecureRandom.uuid.delete('-')[0,8]
	end
  private


  attr_reader :id, :archived
end


ts = Item.new(publish_date: '2018-01-01')
puts ts.id
