
class HandleData
  def self.read(file_name)
    file_name = "data/#{file_name}.json"
    if File.empty?(file_name)
      []
    else
      data = File.read(file_name)
      JSON.parse(data)
    end
  rescue StandardError
    puts "!!#{file_name}file not found !!"
    []
  end

  def self.write(file_name, data_array)
    file_name = "data/#{file_name}.json"
    json_string = JSON.dump(data_array)
    File.write(file_name, json_string)
  rescue StandardError 
		
    puts 'Unable to save to file'
  end
end