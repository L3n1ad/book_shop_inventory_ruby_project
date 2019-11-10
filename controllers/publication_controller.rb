require('sinatra')
require('sinatra/contrib/all')
require('pry-byebug')
require_relative('../models/book.rb')
require_relative('../models/author.rb')
require_relative('../models/publication.rb')
also_reload('../models/*')


# NEW BOOK FOR AUTHOR route

get '/publications/:author_id/add_book' do
  @author = Author.find_by_id(params[:author_id])
  @author_books_ids = @author.books_id
  @books = Book.all
  erb(:"publications/add_book")
end

# CREATE NEW BOOK FOR AUTHOR route

post '/publications/:author_id' do
  publication = Publication.new(params)
  publication.save
  redirect to '/authors'
end

# NEW AUTHOR FOR BOOKS route

get '/publication/:book_id/add_author' do
  @book = Book.find_by_id(params[:book_id])
  @book_authors_ids = @book.authors_id
  @authors = Author.all
  erb(:"books/add_author")
end

# CREATE NEW AUTHOR FOR BOOKS route

post '/publication/:book_id' do
  publication = Publication.new(params)
  publication.save
  redirect to '/books'
end
