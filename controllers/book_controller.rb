require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book.rb')
also_reload('../models/*')

# INDEX route

get '/books' do
  @books = Book.all()
  erb(:"books/index")
end

# SHOW route

get '/books/:id' do
  @book = Book.find_by_id(params[:id])
  erb(:"books/show")
end

# DELETE route

post '/books/:id/delete' do
  book = Book.find_by_id(params[:id])
  book.delete
  redirect to '/books'
end
