require_relative('../db/sqlrunner.rb')

class Book

  attr_reader :id
  attr_accessor :title, :genre, :description, :year

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @genre = options['genre']
    @description = options['description']
    @year = options['year'].to_i
  end

  def save()
    sql = 'INSERT INTO books(title, genre, description, year)
          VALUES ($1, $2, $3, $4)
          RETURNING id'
    values = [@title, @genre, @description, @year]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE books
          SET (title, genre, description, year)
          =
          ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@title, @genre, @description, @year, @id]
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
      romance: [],
      crime: [],
      horror: [],
      poetry: []
    }
    books = Book.all
    for book in books
      if book.genre.downcase == "romance"
        sorted_by_genre[:romance] << book.id
      elsif book.genre.downcase == "crime"
        sorted_by_genre[:crime] << book.id
      elsif book.genre.downcase == "horror"
        sorted_by_genre[:horror] << book.id
      elsif book.genre.downcase == "poetry"
        sorted_by_genre[:poetry] << book.id
      else
        next
      end
    end
    return sorted_by_genre
    # books = Book.all
    # sorted_by_genre = books.group_by{|book| book.genre}
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
