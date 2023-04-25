class Game < Item
    attr_reader :author
    attr_accessor :multiplayer, :last_played_at

    def initialize(multiplayer: false, last_played_at:)
        super(id: publish_date: publish_date, genre: genre, label: label, source: source, author: author)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end

    def can_be_archived?
        if Date.parse(@last_played_at) < Date.today.prev_year(2) && item.can_be_archived?
            true
        else
            false
        end
    end

    def @author=(author)
        @author = author
        author.item << self unless author.item.include?(self)
    end
end
