require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/publication.rb')
require_relative('../models/item.rb')
also_reload('../models/*')

get '/stock' do
  @sorted_by_genre = Item.sort_by_genre
  @genres = Genre.all
  @authors = Author.all
  erb(:"stock/index")
end

post '/stock/sorted_by_author' do
  @author_id = params[:author_id].to_i
  @items_by_author = Item.sort_by_author(@author_id)
  erb(:"stock/sorted_by_author")
end

post '/stock/:id' do
  item = Item.find_by_id(params[:id])
  item.quantity = params[:quantity]
  item.update
  redirect to '/stock'
end

# NEW route

get '/stock/new' do
  @books = Book.all
  @book_ids = Item.all_book_id
  erb(:"stock/new")
end

# CREATE route

post '/stock' do
  item = Item.new(params)
  item.save
  redirect to "/stock"
end
