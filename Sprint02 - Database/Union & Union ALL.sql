-- create two tables
CREATE TABLE book_shop (
	id INT,
  name TEXT,
  release_year INT
);
  
CREATE TABLE favourite_book (
  id INT, 
  author TEXT,
  reviews REAL
);

INSERT INTO book_shop VALUES
  (1, 'Think Like A Freak', 2014),
  (2, 'Ultralearning', 2019),
  (3, 'Blue Ocean Strategy', 2015),
  (4, 'The Power of Habit', 2012),
  (5, 'Outliers', 2008);

INSERT INTO favourite_book VALUES
  (1, 'Steven D. Levitt, Stephen J. Dubner', 1904),
  (4, 'Charles Duhigg', 12007),
  (5, 'Malcolm Gladwell', 12063)
  (6, 'Business Data Science', 2020),
  (7, 'Subliminal', 2018),
  (8, 'Good Strategy Bad Strategy', 2015);

-- Union two tables
SELECT * FROM book_shop
UNION
SELECT * FROM book_shop_new;

-- Union two tables
SELECT * FROM book_shop
UNION ALL
SELECT * FROM book_shop_new;
