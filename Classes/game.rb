require './Classes/item'

class Game < Item
  attr_accessor :name, :multiplayer, :last_played_at

  def initialize(name:'', last_played_at:'', multiplayer:'', author: nil, **args)
    super(**args)
    @name = name
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    @author = author
  end

  attr_writer :author

  private

  def can_be_archived?
    Date.parse(@last_played_at) < Date.today.prev_year(2) && super
  end
end
