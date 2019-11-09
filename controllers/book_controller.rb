require('sinatra')
require('sinatra/contrib/all')
require_relative('../models/book.rb')
also_reload('../models/*')

# INDEX page

get '/books' do
  @books = Book.all()
  erb(:"books/index")
end

# SHOW page

get '/books/:id' do
  @book = Book.find_by_id(params[:id])
  erb(:"books/show")
end
