require_relative 'label'
require_relative 'input_validator'

class LabelController
  include InputValidator
  attr_accessor :labels

  def initialize
    @labels = []
    populate_label_from_file
  end

  def populate_label_from_file
    data = HandleData.read('labels')
    data.each do |label_string|
      label = Label.new
      label.from_json(label_string)
      @labels.push(label)
    end
  end

  def create_label
    puts 'Please enter the following information: '
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = fetch_valid_name('Color: ')
    label = Label.new(title: title, color: color)
    @labels.push(label)
    puts 'New Label created!'
  end

  def list_labels
    if @labels.empty?
      puts 'Please create a label'
    else
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end

  def save_to_file
    prepared_data = @labels.map(&:to_json_custom)
    HandleData.write('labels', prepared_data)
  end
end
