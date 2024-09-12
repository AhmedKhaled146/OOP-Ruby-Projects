# Write a Java program to create a class called "Book" with attributes for title, author, and ISBN,
# and methods to add and remove books from a collection.

class Book
  attr_accessor :title, :author, :isbn

  def initialize(title, author, isbn)
      @title = title
      @author = author
      @isbn = isbn
  end
end

class Library
  def initialize
    @books = []
  end

  def add_book(book)
    @books << book
    puts "#{book.title} by #{book.author} has been added to the library."
  end

  def remove_book(identifier)
    book_to_remove = @books.find { |book| book.title == identifier || book.isbn == identifier }
    if book_to_remove
      @books.delete(book_to_remove)
      puts "#{book_to_remove.title} has been removed from the library."
    else
      puts "Book not found."
    end
  end

  def list_books
    if @books.empty?
      puts "The library is empty."
    else
      puts "Books in the library:"
      @books.each { |book| puts "- #{book.title} by #{book.author} (ISBN: #{book.isbn})" }
    end
  end
end


library = Library.new

# Creating book instances
book1 = Book.new("i will", "ahmed", "123")
book2 = Book.new("good nothing", "khaled", "321")
book3 = Book.new("maght", "ahmed", "213")

# Adding books to the library
library.add_book(book1)
library.add_book(book2)
library.add_book(book3)

# Listing all books in the library
library.list_books

# Removing a book by title
library.remove_book("i will")

# Removing a book by ISBN
library.remove_book("123")

# Listing remaining books in the library
library.list_books