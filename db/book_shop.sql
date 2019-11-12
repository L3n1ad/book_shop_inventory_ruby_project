DROP TABLE IF EXISTS publications;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS authors;
DROP TABLE IF EXISTS books;

CREATE TABLE books(
  id SERIAL8 PRIMARY KEY,
  title VARCHAR(255),
  description VARCHAR(700),
  genre VARCHAR(255),
  cover VARCHAR(255),
  year INT2
);

CREATE TABLE authors(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  description VARCHAR(700),
  profile_img VARCHAR(255),
  date_of_birth VARCHAR(255)
);

CREATE TABLE inventory(
  id SERIAL8 PRIMARY KEY,
  book_id INT8 REFERENCES books(id) ON DELETE CASCADE,
  quantity INT4,
  buying_cost NUMERIC(6, 2),
  selling_price NUMERIC(6, 2)
);

CREATE TABLE publications(
    id SERIAL8 PRIMARY KEY,
    author_id INT8 REFERENCES authors(id) ON DELETE CASCADE,
    book_id INT8 REFERENCES books(id) ON DELETE CASCADE
);
