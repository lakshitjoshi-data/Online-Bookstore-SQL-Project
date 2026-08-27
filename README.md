# Online Bookstore Data Analysis

## Project Overview
This project demonstrates my SQL skills by designing and analyzing a database for a fictional online bookstore. I created a relational database with tables for books, customers, and orders, imported datasets, and wrote queries to extract practical business insights about revenue, inventory, and customer purchasing habits.

## Tools Used
* **SQL:** Table creation, data import (`LOAD DATA INFILE`), joins, and aggregations.
* **Database Management:** Built using standard relational database concepts (Primary/Foreign Keys).

* ## 🛠️ Technical Skills & SQL Concepts Applied
This project demonstrates proficiency in standard and intermediate SQL operations, including:
* **DDL & DML:** Creating databases, defining schemas with constraints (Primary/Foreign Keys), and importing external `.csv` datasets using `LOAD DATA INFILE`.
* **Complex Joins:** Utilizing `INNER JOIN` and `LEFT JOIN` to combine data across the Books, Customers, and Orders tables.
* **Aggregations & Filtering:** Grouping data using `GROUP BY` and applying conditional filters with `HAVING` and `WHERE` clauses to isolate specific trends (e.g., customers with multiple orders).
* **Advanced Functions:** Using `COALESCE()` to handle potential null values when calculating remaining stock, ensuring accurate mathematical outputs.

## Database Schema
The `OnlineBookstore` database consists of three main tables:
* **Books:** Stores details like title, author, genre, price, and current stock count.
* **Customers:** Contains customer contact information and geographic location.
* **Orders:** Tracks sales transactions, linking customers to the books they bought, along with purchase quantities and total spend.

## Key Business Questions Answered
In the `bookstore_queries.sql` file, I wrote both basic and advanced queries to answer questions like:
* **Inventory Management:** What is the remaining stock for each book after fulfilling all current orders? 
* **Sales Tracking:** How many books were sold within each specific genre?
* **Customer Insights:** Which customers are the most valuable based on their total amount spent?
* **Product Pricing:** What are the top 3 most expensive books in the Fantasy genre?

## How to Run This Project
1. Download the `bookstore_queries.sql` script and the three `.csv` files.
2. Open your SQL environment (e.g., MySQL Workbench).
3. Run the first block of code to create the database and tables.
4. Update the file paths in the `LOAD DATA INFILE` statements to point to where you saved the `.csv` files on your local computer.
5. Execute the remaining queries to view the business insights.

 ## 📈 Future Scope
To further expand this project, the next steps could include connecting the SQL database to visualization tools like Power BI or Python (Pandas/Matplotlib) to build an interactive dashboard tracking key performance indicators (KPIs) like monthly revenue growth and top-selling authors.
