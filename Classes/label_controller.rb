require_relative 'label'	


class LabelController
	attr_accessor :labels
	
	def initialize
		@labels = []
	end

	def create_label
		puts "Please enter the following information: "
		print "Title: "
		title = gets.chomp.to_s
		print "Color: "
		color = gets.chomp.to_s
		label = Label.new(title: title, color: color)
		@labels.push(label)
		puts "New Label created!"
	end

	def list_labels
		if @labels.empty?
			puts "Please create a label"
		else
			@labels.each do |label|
				puts "Title: #{label.title}, Color: #{label.color}"
			end
		end
	end
end

lb = LabelController.new
lb.create_label
puts lb.list_labels