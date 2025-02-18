# SQL Project: Sales and Customer Analytics

Exercise Overview
This project demonstrates advanced SQL techniques for performing sales and customer analytics. The purpose of the exercises is to develop a robust understanding of SQL queries and database interactions, using complex operations like stored procedures, triggers, views, and advanced querying techniques.

The project is built on a Sales Database, with tables for CUSTOMER, PRODUCT, SALES, SALES_HISTORY, and SALESPERSON. These exercises cover the core tasks necessary for businesses to analyze their sales data, including revenue tracking, customer purchase history, salesperson performance, and product sales trends.

## What I Did

This repository contains the following SQL challenges and solutions:

1. Stored Procedures

    GetCustomerPurchaseHistory: This procedure returns all purchase records for a given customer, which is useful for viewing detailed customer purchase history.

    GetMonthlySalesSummary: A procedure to retrieve a summary of total sales, quantity sold, and order count for a specific month and year.

2. Triggers

    PreventNegativeSales: A trigger that prevents the insertion of records with negative sales amounts in the SALES table.

    LogSalesUpdates: This trigger logs any updates made to the SALES table, specifically when a sale's total amount is changed. This helps businesses track changes for          auditing purposes.

3. Views

    SalesPerformance: A view that calculates total sales and number of orders for each salesperson, helping managers evaluate their team’s performance.

    CustomerOrderSummary: This view shows customer spending behavior, order count, and the last date they placed an order, useful for customer segmentation and retention        strategies.
   
5. Advanced Querying

    Product Sales Ranking: A query to find the most profitable product each year by calculating total revenue per product.
   
    Unengaged Customers: A query to identify customers who have not made any purchases in the last 6 months, valuable for targeted marketing and re-engagement campaigns.
    Dynamic Queries & Functions

    GetSalespersonTotalSales: A scalar function to calculate the total sales for a given salesperson, useful for performance reviews and bonus calculations.
   

 ### Why This Is Useful
 
  These queries and solutions allow businesses to:

Perform detailed sales performance analysis by salesperson, product, and customer.
Keep track of customer purchase behavior to guide marketing campaigns and customer engagement strategies.
Maintain data integrity and audit capabilities with triggers.
Develop dynamic reports for ongoing business analysis and decision-making.
By using advanced SQL functions such as aggregations, window functions, dynamic queries, and database triggers, this project helps deepen the understanding of SQL for more complex, real-world business problems.

#### Skills and Techniques Covered

SQL Stored Procedures: Encapsulate reusable logic for business processes.

Triggers: Automate business logic and enforce data integrity rules.

Views: Create simplified, reusable queries that present complex data in a user-friendly format.

Advanced SQL Queries: Optimize performance and solve real-world business challenges.

SQL Functions: Create custom functions for reusable calculations or aggregations.

##### Conclusion
This repository provides a structured approach to implementing advanced SQL operations for analyzing sales data and customer behavior. These exercises serve as valuable practice for anyone looking to deepen their SQL skills, especially in data analysis and business intelligence

