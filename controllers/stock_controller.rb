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
  @authors = Author.all
  erb(:"stock/index")
end

post '/stock/sorted_by_author' do
  @author_id = params[:author_id]
  @publications = Publication.sort_by_author[@author_id.to_i]
  erb(:"stock/sorted_by_author")
end

post '/stock' do
  item = Item.new(params)
  item.update
  redirect to '/stock'
end
