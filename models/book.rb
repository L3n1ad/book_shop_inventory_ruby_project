require_relative('../db/sqlrunner.rb')
require('pry-byebug')

class Book

  attr_reader :id
  attr_accessor :title, :genre, :description, :year, :cover

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @description = options['description']
    @year = options['year'].to_i
    @cover = options['cover']
  end

  def save()
    sql = 'INSERT INTO books(title, genre, description, year, cover)
          VALUES ($1, $2, $3, $4, $5)
          RETURNING id'
    values = [@title, @genre, @description, @year, @cover]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE books
          SET (title, genre, description, year, cover)
          =
          ($1, $2, $3, $4, $5)
          WHERE id = $6'
    values = [@title, @genre, @description, @year, @cover, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM books WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def authors
    sql = 'SELECT authors.* FROM authors
          INNER JOIN publications
          ON publications.author_id = authors.id
          WHERE publications.book_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|author| Author.new(author)}
  end

  def authors_id
    sql = 'SELECT authors.id FROM authors
          INNER JOIN publications
          ON publications.author_id = authors.id
          WHERE publications.book_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|author_just_id| author_just_id['id'].to_i}
  end

  def self.sort_by_genre
    sorted_by_genre = {
      'fantasy' => [],
      'comedy' => [],
      'horror' => [],
      'drama' => []
    }
    books = Book.all
    for book in books
      if book.genre.downcase == "fantasy"
        sorted_by_genre['fantasy'] << book.id
      elsif book.genre.downcase == "comedy"
        sorted_by_genre['comedy'] << book.id
      elsif book.genre.downcase == "horror"
        sorted_by_genre['horror'] << book.id
      elsif book.genre.downcase == "drama"
        sorted_by_genre['drama'] << book.id
      else
        next
      end
    end
    return sorted_by_genre
    # books = Book.all
    # sorted_by_genre = []
    # genre_hash = books.group_by{|book| book.genre}
    # genre_hash.each do |genre, books_array|
    #   genre = []
    #   books_array.each do |book|
    #     genre << book.id
    #   end
    #   sorted_by_genre << genre
    # end
    # return sorted_by_genre
  end

  def self.find_by_id(id)
    sql = 'SELECT * FROM books WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Book.new(result)
  end

  def self.all()
    sql = 'SELECT * FROM books;'
    result = SqlRunner.run(sql)
    return result.map{|book| Book.new(book)}
  end

  def self.delete_all()
    sql = 'DELETE FROM books'
    SqlRunner.run(sql)
  end


end
