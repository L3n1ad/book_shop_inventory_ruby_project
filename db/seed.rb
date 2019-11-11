require('pp')
require('pry-byebug')
require_relative('../models/author.rb')
require_relative('../models/book.rb')
require_relative('../models/publication.rb')
require_relative('../models/item.rb')

Publication.delete_all()
Item.delete_all()
Author.delete_all()
Book.delete_all()

author1 = Author.new('first_name' => 'John','last_name' => 'author1','date_of_birth' => 1991,'description' => 'author1 description')
author2 = Author.new('first_name' => 'Mark','last_name' => 'author2','date_of_birth' => 2000,'description' => 'author2 description')
author3 = Author.new('first_name' => 'Clarie','last_name' => 'author3','date_of_birth' => 2010,'description' => 'author3 description')
author4 = Author.new('first_name' => 'Mate','last_name' => 'author4','date_of_birth' => 1700,'description' => 'author4 description')

author1.save
author2.save
author3.save
author4.save

book1 = Book.new('title' => 'book1','genre' => 'Romance','description' => 'I am book1','year' => 2000)
book2 = Book.new('title' => 'book2','genre' => 'Crime','description' => 'I am book2','year' => 1990)
book3 = Book.new('title' => 'book3','genre' => 'Horror','description' => 'I am book3','year' => 1800)
book4 = Book.new('title' => 'book4','genre' => 'Poetry','description' => 'I am book4','year' => 1700)
book5 = Book.new('title' => 'book5','genre' => 'Horror','description' => 'I am book5','year' => 1700)

book1.save
book2.save
book3.save
book4.save
book5.save

publication1 = Publication.new('book_id' => book1.id,'author_id' => author1.id)
publication2 = Publication.new('book_id' => book1.id,'author_id' => author2.id)
publication3 = Publication.new('book_id' => book2.id,'author_id' => author1.id)
publication4 = Publication.new('book_id' => book3.id,'author_id' => author3.id)

publication1.save
publication2.save
publication3.save
publication4.save

item1 = Item.new('book_id' => book1.id, 'quantity' => 1, 'buying_cost' => 4.509, 'selling_price' => 7.75)
item2 = Item.new('book_id' => book2.id, 'quantity' => 5, 'buying_cost' => 4.5, 'selling_price' => 7.75)
item3 = Item.new('book_id' => book3.id, 'quantity' => 3, 'buying_cost' => 4.50, 'selling_price' => 7.75)
item4 = Item.new('book_id' => book4.id, 'quantity' => 10, 'buying_cost' => 4.50, 'selling_price' => 7.75)
item5 = Item.new('book_id' => book1.id, 'quantity' => 4, 'buying_cost' => 4.50, 'selling_price' => 7.75)
item6 = Item.new('book_id' => book3.id, 'quantity' => 10, 'buying_cost' => 4.50, 'selling_price' => 7.75)


item1.save
item2.save
item3.save
item4.save
item5.save
item6.save

binding pry
nil
