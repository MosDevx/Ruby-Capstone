require_relative 'book'
require_relative 'input_validator'

class BookController
	include InputValidator
  attr_accessor :books

  def initialize
    @books = []
  end


	def create_book(author:'', genre:'', label:'')
		puts 'Please enter the following information: '
		print 'Book Title: '
		title = gets.chomp.to_s
		print 'Publisher: '
		publisher = gets.chomp.to_s
		print 'Cover state: '
		cover_state = fetch_valid_name('Cover state: ')


		book = Book.new(title: title, publisher: publisher, cover_state: cover_state, item_init:{author: author, genre: genre, label: label }) 

		@books.push(book)
		puts 'New Book created!'
	end	

end
