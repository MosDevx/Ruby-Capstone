require './Classes/item'

class Game < Item
  attr_reader :id, :publish_date
  attr_accessor :name, :multiplayer, :last_played_at

  def initialize(name:, last_played_at:, multiplayer:, publish_date:)
    super(publish_date: publish_date)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
  end

  def can_be_archived?
    Date.parse(@last_played_at) < Date.today.prev_year(2) && super
  end

  def author=(author)
    @author = author
    author.items << self unless author.items.include?(self)
  end
end
