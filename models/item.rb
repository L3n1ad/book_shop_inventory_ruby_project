require_relative('../db/sqlrunner.rb')

class Item

  attr_reader :id
  attr_accessor :book_id, :quantity, :buying_cost, :selling_price

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @book_id = options['book_id'].to_i
    @quantity = options['quantity'].to_i
    @buying_cost = options['buying_cost'].to_f
    @selling_price = options['selling_price'].to_f
  end

  def save()
    sql = 'INSERT INTO inventory(book_id, quantity, buying_cost, selling_price)
          VALUES ($1, $2, $3, $4)
          RETURNING id'
    values = [@book_id, @quantity, @buying_cost, @selling_price]
    result = SqlRunner.run(sql, values).first
    @id = result['id']
  end

  def update()
    sql = 'UPDATE inventory
          SET (book_id, quantity, buying_cost, selling_price)
          =
          ($1, $2, $3, $4)
          WHERE id = $5'
    values = [@book_id, @quantity, @buying_cost, @selling_price, @id]
    SqlRunner.run(sql, values)
  end

  def delete()
    sql = 'DELETE FROM inventory WHERE id = $1'
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def check_quantity_low
   if @quantity < 5
     return true
   else
     return false
   end
  end

  def markup
    return @selling_price - @buying_cost
  end

  def self.sort_by_genre
    items_sorted_by_genre = {
      romance: [],
      crime: [],
      horror: [],
      poetry: []
    }
    items = Item.all
    sorted_book_ids = Book.sort_by_genre
    for item in items
      if sorted_book_ids[:romance].include?(item.book_id)
        items_sorted_by_genre[:romance] << item
      elsif sorted_book_ids[:crime].include?(item.book_id)
        items_sorted_by_genre[:crime] << item
      elsif sorted_book_ids[:horror].include?(item.book_id)
        items_sorted_by_genre[:horror] << item
      elsif sorted_book_ids[:poetry].include?(item.book_id)
        items_sorted_by_genre[:poetry] << item
      end
    end
    return items_sorted_by_genre
  end



  def self.find_by_book_id(id)
    sql = 'SELECT * FROM inventory WHERE book_id = $1'
    values = [id]
    result = SqlRunner.run(sql, values)
    return Item.new(result.first)
  end


  def self.find_by_id(id)
    sql = 'SELECT * FROM inventory WHERE id = $1'
    values = [id]
    result = SqlRunner.run(sql, values).first
    return Item.new(result)
  end

  def self.all()
    sql = 'SELECT * FROM inventory;'
    result = SqlRunner.run(sql)
    return result.map{|item| Item.new(item)}
  end

  def self.all_book_id
    sql = 'SELECT inventory.book_id FROM inventory'
    result = SqlRunner.run(sql)
    return result.values.flatten.uniq
  end

  def self.delete_all()
    sql = 'DELETE FROM inventory'
    SqlRunner.run(sql)
  end



end
