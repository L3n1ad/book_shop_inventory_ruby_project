require_relative('../db/sqlrunner.rb')

class Publication

  attr_reader :id
  attr_accessor :book_id, :author_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @author_id = options['author_id'].to_i
  end

  def save()
    sql = 'INSERT INTO publications(book_id, author_id)
          VALUES ($1, $2)
          RETURNING id'
    values = [@book_id, @author_id]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE publications
          SET (book_id, author_id)
          =
          ($1, $2)
          WHERE id = $3'
    values = [@book_id, @author_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM publications WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end


  def self.find_by_id(id)
    sql = 'SELECT * FROM publications WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Publication.new(result)
  end

  def self.all()
    sql = 'SELECT * FROM publications;'
    result = SqlRunner.run(sql)
    return result.map{|publication| Publication.new(publication)}
  end

  def self.delete_all()
    sql = 'DELETE FROM publications'
    SqlRunner.run(sql)
  end


end
