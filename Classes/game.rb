class Game < Item
  attr_reader :author
  attr_accessor :multiplayer, :last_played_at

  def initialize(last_played_at:, multiplayer: false, **args)
    super(**args)
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
