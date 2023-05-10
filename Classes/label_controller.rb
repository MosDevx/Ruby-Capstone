require_relative 'label'
require_relative 'input_validator'
require_relative 'read_save_helper'

class LabelController
  include ReadSaveHelper
  include InputValidator
  attr_accessor :labels

  def initialize
    @labels = populate_from_file('labels') || []
  end

  def create_label
    puts 'Please enter the following (Label) info: '
    print 'Title: '
    title = gets.chomp.to_s
    print 'Color: '
    color = fetch_valid_name('Color: ')

    full_name = title + color

    if new_label?(full_name)
      label = Label.new(title: title, color: color)
      @labels << label
      puts
      puts '+++ New Label created! +++'
      puts
      label
    else
      puts
      puts 'Label already exists!'
      existing_label = @labels.find {	|lbl| lbl.to_s == full_name.downcase }
      puts 'Returning existing label...'
      puts
      existing_label
    end

    # label = Label.new(title: title, color: color)
    # @labels.push(label)
    # puts
    # puts '+++ New Label created! +++'
    # puts
  end

  def new_label?(full_name)
    labels.each do |label|
      return false if label.to_s == full_name.downcase
    end
    true
  end

  def list_labels
    if @labels.empty?
      puts '~~ No labels found ~~'
    else
      puts '<<< List of Labels >>>'
      @labels.each do |label|
        puts "Title: #{label.title}, Color: #{label.color}"
      end
    end
  end
end
