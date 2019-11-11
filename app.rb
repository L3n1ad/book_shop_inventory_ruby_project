require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/book_controller.rb')
require_relative('controllers/author_controller.rb')
require_relative('controllers/publication_controller.rb')
require_relative('controllers/stock_controller.rb')
also_reload('../models/*')

get '/' do
  erb(:index)
end
