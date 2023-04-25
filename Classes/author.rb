require 'securerandom'

class Author 
    attr_reader :item
    def initialize(first_name: '', last_name: '')
        @first_name = first_name
        @last_name = last_name
        generate_id
        @items = []
    end

    def generate_id
        @id = SecureRandom.uuid.delete('-')[0, 8]
    end

    def add_item(item)
        @items << item
        item.author = self
    end
end