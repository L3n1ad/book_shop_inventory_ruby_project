require_relative('../db/sqlrunner.rb')

class Author

  attr_reader :id
  attr_accessor :first_name, :last_name, :date_of_birth, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birth = options['date_of_birth'].to_i
    @description = options['description']
  end

  def save()
    sql = 'INSERT INTO authors(first_name,last_name,date_of_birth,description)
          VALUES ($1, $2, $3, $4)
          RETURNING id'
    values = [@first_name, @last_name, @date_of_birth, @description]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE authors
          SET (first_name, last_name, date_of_birth, description)
          =
          ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@first_name, @last_name, @date_of_birth, @description, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM authors WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def pretty_name
    pretty_name = "#{@first_name} #{@last_name}"
    return pretty_name
  end


  def books
    sql = 'SELECT books.* FROM books
          INNER JOIN publications
          ON publications.book_id = books.id
          WHERE publications.author_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map {|book| Book.new(book)}
  end

  def books_id
    sql = 'SELECT books.id FROM books
          INNER JOIN publications
          ON publications.book_id = books.id
          WHERE publications.author_id = $1'
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|book_just_id| book_just_id['id'].to_i}
  end


  def self.find_by_id(id)
    sql = 'SELECT * FROM authors WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Author.new(result)
  end

  def self.all()
    sql = 'SELECT * FROM authors;'
    result = SqlRunner.run(sql)
    return result.map{|author| Author.new(author)}
  end

  def self.delete_all()
    sql = 'DELETE FROM authors'
    SqlRunner.run(sql)
  end


end
