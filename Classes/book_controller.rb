require_relative 'book'
require_relative 'input_validator'
require_relative 'handle_data'

class BookController
  include InputValidator
  attr_accessor :books

  def initialize
    @books = []
    populate_books_from_file
  end

  def populate_books_from_file
    raw_data = HandleData.read('books')

    raw_data.each do |book_string|
      book = Book.new
      book.from_json(book_string)
      @books.push(book)
    end
  end

  def create_book(author: '', genre: '', label: '')
    print 'Book Title: '
    title = gets.chomp.to_s
    print 'Publisher: '
    publisher = gets.chomp.to_s
    print 'Publish date-(YYYY-MM-DD):  '
    publish_date = fetch_valid_date('Publish date-(YYYY-MM-DD):  ')
    print 'Cover state: (g)ood, (b)ad, or (o)k : '
    cover_state = fetch_valid_cover_state('Cover state: (g)ood, (b)ad, or (o)k : ')

    book = Book.new(title: title, publisher: publisher, cover_state: cover_state,
                    item_init: { author: author, genre: genre, label: label, publish_date: publish_date })

    @books.push(book)
    puts '+++ New Book created! +++'
  end

  def list_books
    if @books.empty?
      puts 'No books found!'
    else
      puts '<<< List of Books >>>'
      @books.each do |book|
        print "Title: #{book.title} "
        puts "Author: #{book.author}"
      end
    end
  end

  def save_to_file
    prepared_data = @books.map(&:to_json_custom)
    HandleData.write('books', prepared_data)
  end
end

bc = BookController.new
bc.create_book

# bc.list_books

# bc.save_to_file
