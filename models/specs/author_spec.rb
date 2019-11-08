require('minitest/autorun')
require('minitest/rg')
require_relative('../author.rb')

class AuthorTest < MiniTest::Test

  def setup
    @author1 = Author.new(
      'first_name' => 'John',
      'last_name' => 'Parker',
      'date_of_birt' => 1991,
      'description' => 'author1 description'
    )
  end

  def test_pretty_name
    result = @author1.pretty_name
    assert_equal("John Parker", result)
  end

end
