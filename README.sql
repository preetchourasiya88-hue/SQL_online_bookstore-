create database practice ;
CREATE DATABASE OnlineBookstore;
use onlinebookstore;
CREATE TABLE Books (
    Book_ID INT PRIMARY KEY,
    Title VARCHAR(100),
    Author VARCHAR(100),
    Genre VARCHAR(50),
    Published_Year INT,
    Price NUMERIC(10 , 2 ),
    Stock INT
);
select*
from Books;

	

Create Table Customers (
Customer_ID serial primary key,
Name varchar(100),
Email varchar(100),
Phone varchar(15),
City varchar(50),
Country varchar(150)
);
select * 
from Customers;



Create table Orders (
Order_ID serial primary key,
Customer_ID int references Customers(Customer_ID),
Book_ID int references Books(Books_ID),
Order_Date Date,
Quantity int,
Total_Amount numeric(10,2)
);
select *
from Orders;

 

 --- retrieve all books in the "fiction" genre:
 select *
 from Books
 where genre="Fiction";
 
 
 ---  find books published after the year 1950
 select *
 from Books
 where Published_Year>1950;
 
 
 --- list all the customer from the canada ?
 select *
 from Customers
 where Country = "canada";
 
 
 
 --- show Orders placed in november 2023
select * 
from Orders
where Order_Date between "2023-11-1" and "2023-11-30";


--- retrieve the total stock of books available
select sum(Stock)
from Books;


--- find the details of the most expensive book
select * from Books
order by price desc
limit 1;

--- show all customers who ordered more than 1 quantity of a book
select *
from Orders
where Quantity > 1;



--- retrieve all Orders where the total amount exceeds $20
select * from Orders 
where Total_Amount > 20;


--- list all genres available in the books table 
select distinct(Genre)
from Books;


--- find the book with the lowest stock 
select *
from Books 
order by Stock asc
limit 1



--- calculate the total revenue genrated from all orders 
select SUM(Total_Amount)
from Orders;



--- retrieve the total number of books sold for each genre
select B.Genre, sum(O.Quantity ) as total_books_sold
from Orders O
join Books B
ON  O.Book_ID = B.Book_ID
group by B.Genre;

--- find the average price of books in "fintasy" genre
select avg(price) AS average_price 
from books
where genre = "fantasy";



--- list customer who have placed at least 2 orders
select Customer_ID,count(Order_ID) 
from Orders
group by Customer_ID
having count(Order_ID)>=2;


--- find the most frequently ordered book 
select Book_ID, count(Order_ID)
from orders
group by Book_ID
Order by count(Order_ID)desc 
limit 1;

--- show the top 3 most expensive books of "fantasy"genre
select * from books
where genre = "fantasy"
order by price desc 
limit 3;


--- retrieve the total quantity of books sold by each author 
select b. author , sum(o.quantity)  
from orders o 
join books b on o.book_id = b.book_id
Group by b.author;


--- list the cities where customer who spent ovr $30 are located 
select distinct C.City, Total_Amount
from Orders O
join Customers C on O.Customer_ID = C.Customer_ID
where O.Total_Amount > 30;


--- find the customer who spend the most on orders

select C.Customer_ID, C.Name, SUM(O.Total_Amount) AS Total_spent
from Orders O
join Customers C on O.Customer_ID = C.Customer_ID
group by  C.Customer_id, C.Name
order by Total_spent desc


--- calculate the stock remaining after fulfilling all orders

SELECT b.book_id,b.title,b.stock AS initial_stock,
    COALESCE(SUM(o.quantity), 0) AS total_sold,
    b.stock - COALESCE(SUM(o.quantity), 0) AS remaining_stock
FROM books b
LEFT JOIN orders o
ON b.book_id = o.book_id
GROUP BY b.book_id, b.title, b.stock;

 
