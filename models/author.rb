require_relative('../db/sqlrunner.rb')

class Author

  attr_reader :id
  attr_accessor :first_name, :last_name, :date_of_birt, :description

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
    @date_of_birt = options['date_of_birt'].to_i
    @description = options['description']
  end

  def save()
    sql = 'INSERT INTO authors(first_name,last_name,date_of_birt,description)
          VALUES ($1, $2, $3, $4)
          RETURNING id'
    values = [@first_name, @last_name, @date_of_birt, @description]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE authors
          SET (first_name, last_name, date_of_birt, description)
          =
          ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@first_name, @last_name, @date_of_birt, @description, @id]
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
