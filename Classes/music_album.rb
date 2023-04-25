require_relative 'item'

class MusicAlbum < Item
    attr_accessor :on_spotify

    def initialize (on_spotify: false, publish_date:, name:)
        super(publish_date)
        @on_spotify = on_spotify
        @name = name
    end

    def can_be_archived?
        super && @on_spotify
    end
end