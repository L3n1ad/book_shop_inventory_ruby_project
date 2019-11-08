require('pp')
require_relative('../models/author.rb')


Author.delete_all()

author1 = Author.new(
  'first_name' => 'John',
  'last_name' => 'author1',
  'date_of_birt' => 1991,
  'description' => 'author1 description'
)

author1.save()
pp Author.all
pp '==============='
