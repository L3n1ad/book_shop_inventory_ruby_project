require('minitest/autorun')
require('minitest/rg')
require_relative('../item.rb')

class ItemTest < MiniTest::Test

  def setup
    @item1 = Item.new('book_id' => 1, 'quantity' => 1, 'buying_cost' => 4.50, 'selling_price' => 7.75)
    @item2 = Item.new('book_id' => 2, 'quantity' => 5, 'buying_cost' => 4.50, 'selling_price' => 7.75)
    @item3 = Item.new('book_id' => 3, 'quantity' => 10, 'buying_cost' => 4.50, 'selling_price' => 7.75)
  end

  def test_check_quantity_low__under_limit
    result = @item1.check_quantity_low
    assert_equal(true, result)
  end

  def test_check_quantity_low__on_limit
    result = @item2.check_quantity_low
    assert_equal(false, result)
  end

  def test_check_quantity_low__over_limit
    result = @item3.check_quantity_low
    assert_equal(false, result)
  end

  def test_markup
    result = @item2.markup
    assert_equal(3.25, result)
  end

end
