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


	def breaker (items=[])

		# make arrays
		my_hash = {}
		
		items.each do |item|
		
			array_name = item.class.to_s.downcase + 's'
			puts array_name
			array_name = array_name.to_sym
		
			if(my_hash[array_name].nil?)
				my_hash[array_name] = []
				my_hash[array_name].push(item)
			else
				my_hash[array_name].push(item)
			end
		end
		puts my_hash[:games][0].multiplayer
	end

	end
