module InputValidator
  VALID_ALPHA = ('a'...'z').to_a

  def fetch_valid_name(place_holder)
    input = gets.chomp
    lower_input = input.downcase
    until lower_input.chars.all? { |char| VALID_ALPHA.include?(char) }
      puts 'Please enter only letters!!'
      print place_holder
      input = gets.chomp
      lower_input = input.downcase
    end
    input
  end

  def fetch_valid_number(place_holder)
    begin
      user_age = Integer(gets.chomp)
    rescue StandardError
      puts 'Please enter an integer number!!'
      print place_holder
      retry
    end
    user_age
  end
end
