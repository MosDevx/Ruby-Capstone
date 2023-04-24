require 'securerandom'
require 'date'

class Item
  attr_accessor :genre, :author, :source, :label, :publish_date

  def initialize(publish_date: '', genre: '', label: '', source: '', author: '')
    @publish_date = publish_date
    generate_id
    @genre = genre
    @label = label
    @source = source
    @author = author
  end

  def generate_id
    @id = SecureRandom.uuid.delete('-')[0, 8]
  end

  def can_be_archived?
    last_decade = Date.today - (10 * 365)
    @published_date < last_decade
  end

  private

  attr_reader :id, :archived
end


ts = Item.new(publish_date: '2018-01-01')
puts ts.id
