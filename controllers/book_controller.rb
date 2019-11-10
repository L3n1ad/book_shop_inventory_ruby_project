require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/publication.rb')
require_relative('../models/genre.rb')
also_reload('../models/*')

# INDEX route

get '/books' do
  @books = Book.all()
  erb(:"books/index")
end

# NEW route

get '/books/new' do
  @authors = Author.all
  @genres = Genre.all
  erb(:"books/new")
end

# CREATE route

post '/books' do
  book = Book.new(params)
  book.save
  publication = Publication.new('author_id' => params[:author_id], 'book_id' => book.id)
  publication.save
  redirect to "/books"
end

# SHOW route

get '/books/:id' do
  @book = Book.find_by_id(params[:id])
  @authors = @book.authors
  erb(:"books/show")
end

# EDIT route

get '/books/:id/edit' do
  @book = Book.find_by_id(params[:id])
  @genres = Genre.all
  erb(:"books/edit")
end

# UPDATE route

post '/books/:id' do
  book = Book.new(params)
  book.update
  redirect to '/books'
end

# DELETE route

post '/books/:id/delete' do
  book = Book.find_by_id(params[:id])
  book.delete
  redirect to '/books'
end
