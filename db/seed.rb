require('pp')
require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/publication.rb')

Publication.delete_all()
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

book2 = Book.new(
  'title' => 'book2',
  'genre' => 'Drama',
  'description' => 'I am book2',
  'year' => 1900
)

book2.save

publication1 = Publication.new(
  'book_id' => book1.id,
  'author_id' => author1.id
)

publication1.save


binding pry
nil
