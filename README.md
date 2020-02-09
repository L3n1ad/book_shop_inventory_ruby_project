# book_shop_inventory_ruby_project

My first CodeClan single project created using Ruby(as main language), Sinatra (Web Application frameWork),
PSQL(Database and MiniTest(Testing). The project is featuring a book shop inventory system where user can add
new books, new authors, edit both books and authors and add books as items to their inventory. On the Stock page 
user can change the amount for items, it also highlight if the item is low on stock. The app uses RESTful routes
and full CRUD.

# To run the project

Install Sinatra;

```
gem install sinatra;
```

Create postgres sql database(the app built to run with DB name if you 
want to change it change db name in sqlrunner.rb):

```
createdb book_shop;
```

Run sql file in db to create tables;

```
psql book_shop < db/book_shop.sql;
```

Populate tables with seed data;

```
ruby db/seed.rb;
```

Run application on port 4567(the message in the terminal will show the 
exact port which can be different in case of other Sinatra app running in the same time);

```
ruby app.rb;
```
