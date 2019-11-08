require('pp')
require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/book.rb')


Author.delete_all()
Book.delete_all()

author1 = Author.new(
  'first_name' => 'John',
  'last_name' => 'author1',
  'date_of_birt' => 1991,
  'description' => 'author1 description'
)

author1.save

book1 = Book.new(
  'title' => 'book1',
  'genre' => 'Comedy',
  'description' => 'I am book1',
  'year' => 2000
)

book1.save


binding pry
nil
