module FromJsonHelper
  def gather_items(books: [], games: [], music_albums: [])
    new_books = books.map do |bk|
      book = Book.new
      book.from_json(bk)
      book
    end

    games.map do |gm|
      game = Game.new
      game.from_json(gm)
      game
    end
    music_albums = music_albums.map do |ma|
      music_album = MusicAlbum.new
      music_album.from_json(ma)
      music_album
    end

    new_books + games + music_albums
  end

  def break_up_items(items)
    books = []
    games = []
    music_albums = []

    items.each do |item|
      if item.instance_of?(Book)
        books << item
      elsif item.instance_of?(Game)
        games << item
      elsif item.instance_of?(MusicAlbum)
        music_albums << item
      end
    end

    [books, games, music_albums]
  end

  def breaker(items = [])
    # make arrays
		# puts items
    my_hash = {}

    items.each do |item|
      array_name = "#{item.class.to_s.downcase}s"
      array_name = array_name.to_sym

      my_hash[array_name] = [] if my_hash[array_name].nil?
      my_hash[array_name].push(item)
    end
    # puts my_hash
		

		json_the_hash(my_hash)

  end


	def json_the_hash(hash)
		jsoned ={}
		hash.each do |key, value|
			jsoned[key] = value.map(&:to_json_custom)	
		end

		# puts jsoned.to_json
		unhash_the_json(jsoned.to_json)


	end

	def unhash_the_json(json_string)
		hash = JSON.parse(json_string)
		# puts hash
		uniter(hash)
	end

	def uniter(hash)
		items_array = []
		hash.each do |key, value|

			value.each do |obj_data|
				new_obj = item_factory(key)
				new_obj.from_json(obj_data)
				items_array << new_obj
			end
		
		end

		puts items_array
	end

	def item_factory(item_type)
			class_name = item_type.delete('s')
			case class_name
			when 'book'
				Book.new
			when 'game'
				Game.new
			when 'music_album'
				MusicAlbum.new
			end
	end

end
