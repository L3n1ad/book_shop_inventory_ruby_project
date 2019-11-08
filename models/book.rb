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
