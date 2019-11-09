require('sinatra')
require('sinatra/contrib/all')
require_relative('controllers/book_controller.rb')

get '/' do
  erb(:index)
end
