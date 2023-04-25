class Genre
    attr_reader :id, :name, :item

    def initialize(name)
        @id = Random.rand(1..1000)
        @name = name
        @item = []
    end
end