# Write a Ruby program to create a class called "Library" with a collection of books and methods to add and remove books.

class Library

  def initialize
    @books = []
  end

  def add_book(title)
    @books << title
    puts "'#{title}' has been added to the library."
  end

  def remove_book(title)
    if @books.include?(title)
      @books.delete(title)
      puts "'#{title}' has been removed from the library."
    else
      puts "'#{title}' is not found in the library."
    end
  end

  def list_books
    if @books.empty?
      puts "The library is empty."
    else
      puts "Books currently in the library:"
      @books.each { |book| puts "- #{book}" }
    end
  end
end

# Example Usage:
library = Library.new

library.add_book("Great One") # Add One
library.add_book("Hebta") # Add One
library.add_book("Sera") # Add One

library.list_books

library.remove_book("Hebta")

library.list_books

library.remove_book("Ahmed's Story") # Not Exist
