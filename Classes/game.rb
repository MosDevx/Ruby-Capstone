class Game < Item

    def initialize(multiplayer: false, last_played_at:)
        super(id: publish_date: publish_date, genre: genre, label: label, source: source, author: author)
        @multiplayer = multiplayer
        @last_played_at = last_played_at
    end
end
