module ReadSaveHelper

  def populate_from_file(filename)
    data = HandleData.read(filename)
		data_array = []
   
		unless data.empty?
			data.each do |item_string|
				item = item_factory(filename)
				item.from_json(item_string)
				data_array.push(item)
			end

    return data_array
  else
    return []
  end
  end

	def save_to_file(filename,data_array)
    prepared_data = data_array.map(&:to_json_custom)
    HandleData.write(filename, prepared_data)
  end


	def item_factory(item_type)
		class_name = item_type.delete('s')
		case class_name
		when 'genre'
			Genre.new
		when 'label'
			Label.new
		when 'author'
			Author.new
		when 'book'
			Book.new
		when 'game'
			Game.new
		when 'music'
			MusicAlbum.new
		end
end
end