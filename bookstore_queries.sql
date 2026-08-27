CREATE DATABASE OnlineBookstore;

USE OnlineBookStore;

-- Create Tables
DROP TABLE IF EXISTS Books;
CREATE TABLE Books (
    Book_ID SERIAL PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10, 2),
    Stock INT
);
DROP TABLE IF EXISTS customers;
CREATE TABLE Customers (
    Customer_ID SERIAL PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    City VARCHAR(50),
    Country VARCHAR(150)
);
DROP TABLE IF EXISTS orders;
CREATE TABLE Orders (
    Order_ID SERIAL PRIMARY KEY,
    Customer_ID INT REFERENCES Customers(Customer_ID),
    Book_ID INT REFERENCES Books(Book_ID),
    Order_Date DATE,
    Quantity INT,
    Total_Amount NUMERIC(10, 2)
);

SELECT * FROM Books;
SELECT * FROM Customers;
SELECT * FROM Orders;

--Import data books

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Books.csv'
INTO TABLE Books
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

--Import data customers

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Customers.csv'
INTO TABLE Customers
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

--Import data orders

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Orders.csv'
INTO TABLE Orders
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;  

--Questions--

--1- Retrieve all books in the Fiction genre--
SELECT * FROM Books
Where Genre = 'Fiction';

--2-- FIND books published after the year 1950
SELECT * from Books
WHERE Published_Year >1950;

--3-- List all customers from the canada
SELECT * from Customers
where Country ='Canada';

--4--Show order placed in november 2023
SELECT * from Orders
Where order_date Between '2023-11-01' AND '2023-11-30';

--5--Retrieve the total stock of books available
SELECT SUM(Stock) AS Total_Stock from Books;

--6--Find the details of the most expensive books
SELECT * from Books
Order by price DESC LIMIT 1;

--7--Show all customers who ordered more than 1 quantity of the book
SELECT * from Orders
WHERE quantity >1;

--8--Retrieve all orders where the total amount exceeds $20
SELECT * from orders
where total_amount>20;

--9-- List all generes available in the books table
SELECT Distinct Genre FROM Books;

--10-- Find the book with the lowest stock
SELECT * from Books
order by Stock 
LIMIT 1;

--11-- Calculated the total revenue generated from all orders
SELECT SUM(Total_Amount) As Total_Revenue
FROM Orders;

--Advance Questions--

--1--Retrieve the total number of books sold for each genre
SELECT b.Genre,SUM(o.Quantity)
FROM Orders o
 LEFT Join Books b
 ON o.book_id = b.book_id
 GROUP BY b.Genre; 
 
 --2--Find the avg price of the books in the fantasy genre
 SELECT AVG(Price) As Average_price
 From Books
 Where Genre = 'Fantasy';
 
 --3--List customers who have placed at least 2 orders
 SELECT c.customer_id, c.Name,Count(o.Order_id) As Total_Count
FROM Customers c
JOIN Orders o ON c.Customer_id = o.Customer_id
GROUP BY c.Customer_id, c.Name
HAVING COUNT(o.Order_id) >= 2; 

--4--Find the most frequently ordered book:
 SELECT o.book_id,b.Title,Count(o.Order_id) AS Order_count
 From Orders o
 Join Books b 
 ON b.book_id = o.book_id
 group by b.Title, o.book_id
 order by Order_count desc limit 1;
 
 --5--Show the top 3 most expensive books of Fantasy genre
 SELECT * from Books
 where Genre = 'Fantasy'
 order by price desc limit 3;
 
 --6-- Retrieve the total quantity of books sold by each author:
 SELECT b.Author,SUM(o.Quantity) As Total_book_sold
 from Orders o
 JOIN Books b
 ON o.book_id=b.book_id
 Group by b.Author;
 
 --7--List the cities where customers who spent over $30 are located
 SELECT distinct(c.City),o.Total_amount
 from Customers c
 Join Orders o
 On c.customer_id = o.customer_id
 where o.Total_amount>30;
 
 --8--Find the customer who spent the most on orders:
 SELECT c.Name,SUM(o.Total_amount) As Total_spent
 from Customers c
 join Orders o
 ON c.customer_id =o.customer_id
  group by c.customer_id, c.Name
 order by Total_spent desc limit 1;
 
 --9--Calculate the stock remaining after fulfilling all orders:
 SELECT b.book_id, b.title, b.stock, COALESCE(SUM(o.quantity),0) AS Order_quantity,  
	b.stock- COALESCE(SUM(o.quantity),0) AS Remaining_Quantity
FROM books b
LEFT JOIN orders o ON b.book_id=o.book_id
GROUP BY b.book_id ORDER BY b.book_id;

 
