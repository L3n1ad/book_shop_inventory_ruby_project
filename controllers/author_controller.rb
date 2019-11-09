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
#
# # EDIT route
#
# get '/books/:id/edit' do
#   @book = Book.find_by_id(params[:id])
#   erb(:"books/edit")
# end
#
# # UPDATE route
#
# post '/books/:id' do
#   book = Book.new(params)
#   book.update
#   redirect to '/books'
# end
#
# # DELETE route
#
# post '/books/:id/delete' do
#   book = Book.find_by_id(params[:id])
#   book.delete
#   redirect to '/books'
# end
#
# # ADD NEW AUTHOR FORM route
#
# get '/publication/:book_id/add_author' do
#   @book = Book.find_by_id(params[:book_id])
#   @book_authors_ids = @book.authors_id
#   @authors = Author.all
#   erb(:"books/add_author")
# end
#
# # CREATE NEW AUTHOR route
#
# post '/publication/:book_id' do
#   publication = Publication.new(params)
#   publication.save
#   redirect to '/books'
# end
