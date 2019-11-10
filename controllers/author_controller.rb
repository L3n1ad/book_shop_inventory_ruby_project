require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/publication.rb')
also_reload('../models/*')

# INDEX route

get '/authors' do
  @authors = Author.all
  erb(:"authors/index")
end

# NEW route

get '/authors/new' do
  @books = Book.all
  erb(:"authors/new")
end

# CREATE route

post '/authors' do
  author = Author.new(params)
  author.save
  publication = Publication.new('book_id' => params[:book_id], 'author_id' => author.id)
  publication.save
  redirect to "/authors"
end

# SHOW route

get '/authors/:id' do
  @author = Author.find_by_id(params[:id])
  @books = @author.books
  erb(:"authors/show")
end

# EDIT route

get '/authors/:id/edit' do
  @author = Author.find_by_id(params[:id])
  erb(:"authors/edit")
end

# UPDATE route

post '/authors/:id' do
  author = Author.new(params)
  author.update
  redirect to '/authors'
end

# DELETE route

post '/authors/:id/delete' do
  author = Author.find_by_id(params[:id])
  author.delete
  redirect to '/authors'
end
