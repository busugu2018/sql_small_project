SELECT * FROM Zeal9_employee.employee;

use Zeal9_employee;

-- 1.1) Fetch all details of employees whose name starting with ‘A’
Select * from Employee where Emp_name like "A%";

-- 1.2) Find unique Emp_id who are working in HR department
Select distinct Emp_id from Employee where Department = 'HR';

-- 1.3) Find top 3 rows in terms of salary
select * from Employee order by salary desc limit 3;
 
-- 1.4) print details of employees whose name ends with ‘A’ and contains 6 alphabets only.
select * from Employee where Emp_name like '%A' and char_length(Emp_name) = 6;

-- 1.5) Fetch details of employees whose salary lies in between 50000 and 80000
SELECT * FROM Employee WHERE Salary BETWEEN 50000 AND 80000;

-- 1.6) Each employee received 10% hike of salary, Now Add a new column name (new_salary) and update it with new salary details.
ALTER TABLE Employee ADD Column new_salary DECIMAL(10, 2);
Update Employee SET new_salary = Salary * 10;

-- 1.7) Find the total salary of unique emp_id’s from employee table.
select distinct sum(Salary) from Employee group by Emp_id;

-- 1.8) Fetch the duplicate records from the employee table.
select * from Employee group by Emp_id having count(*)>1;
-- select Emp_id, count(*) from Employee;

-- 1.9) Write a query to delete the duplicate records from the employee table
-- Final answer
With EmployeeCTE as 
(
	select *, 
    row_number() over (partition by Emp_ID order by Emp_id) as rowNumber
    from Employee
)
delete from EmployeeCTE where rowNumber > 1;
select * from Employee;

-- To see where we were going to
With EmployeeCTE as 
(
	select *, 
    row_number() over (partition by Emp_ID order by Emp_id) as rowNumber
    from Employee
)
select * from EmployeeCTE;



-- 1.10) Create empty table with same structure that as of employee table
CREATE TABLE Employee_copy LIKE Employee;
CREATE TABLE Employee_copy AS SELECT * FROM Employee WHERE 1=0;
select * from Employee_copy;

-- 1.11) Fetch only the last two characters of the emp_name (Hint: substring)
-- Final answer
SELECT SUBSTRING(Emp_name, LENGTH(Emp_name) - 1, 2) AS Emp_name
FROM Employee;

-- these are just tests to review before submission
SELECT *, SUBSTRING(Emp_name, LENGTH(Emp_name) - 1, 2) AS Emp_name_last2
FROM Employee;

SELECT Emp_name, SUBSTRING(Emp_name, LENGTH(Emp_name) - 1, 2) AS Emp_name
FROM Employee;

SELECT Emp_id, 
	SUBSTRING(Emp_name, LENGTH(Emp_name) - 1, 2) AS Emp_name,
    Department, 
    Salary, 
    new_salary
FROM Employee;






-- Considering that the duplicate entries are refined from the above table, 
-- Write queries for below:



-- Q2) Aggregate functions:
-- 2.1) Write a query to find the no.of rows whose emp_id is less than 150
select count(*) from Employee where Emp_id < 150; 

-- 2.2) Find the maximum salary of the employee table whose emp_id is less than 160
select max(salary) as salary from Employee where Emp_id < 160;

-- 2.3) Find the maximum salary of the employee table whose emp_id is greater than 150
select max(salary) as salary from Employee where Emp_id > 150;

-- 2.4) Find the average salary of the employee table.
select avg(salary) as salary from Employee;




-- Q3)
-- Fetch all the rows of two tables in a single query
SELECT * FROM customer UNION ALL SELECT * FROM supplier;

-- Fetch all the rows of two tables in a single query with no duplicates.
SELECT * FROM customer UNION SELECT * FROM supplier;

-- Find the cust_id‘s of customer table where Address is Dallas, Seattle, Chicago, Miami
-- But contact not equal to 101
select Cust_id 
	from customer 
    where Address in ('Dallas', 'Seattle', 'Chicago', 'Miami')
    and contact != 101;









-- Intermediate LEVEL 1:
-- row_Number column was added specially to avaid replication error in MySQL.


-- Q1) 
-- Write SQL queries for the following: Create a table with top 5 cards for each day based on the amount spent (use the table provided as reference)
-- 1. Top 5 cards on the amount spent
select * from Card_info order by Transaction_Amount desc limit 5;

-- 2. Top cards on ‘16-09-2018’
select * from Card_info where Date = '2018-09-16' order by Transaction_Amount Desc;

-- 3. Top 5 cards for each day based on the amount spent
SELECT *
FROM ( 
	SELECT *,
        ROW_NUMBER() OVER (PARTITION BY Date ORDER BY Transaction_Amount DESC) as Transaction_Rank 
	FROM Card_info
) ranked_transactions 
WHERE Transaction_Rank <= 5 
ORDER BY Date, Transaction_Rank;



-- Q2)
-- Provide the outputs of LEFT (Keep table X on Left side), INNER & FULL OUTER joins for the following two tables 




-- Q3)
-- What will be the output of the following Query?
-- SELECT CASE WHEN null=null THEN ‘Milk’ Else ‘Egg’ END from DUAL;

-- Answer 3: 
-- The output of the following Query ‘Egg’ because null=null is false, and else is "'Egg'.






-- Q4)
-- Answer the following questions:
-- 1. What is the possible data type of the column ‘COL1’?





-- 2. What will the output of the following SQL statements be?
--      ‘SELECT COUNT(*) AS ENTRIES FROM TABLE;’
--      ‘SELECT COUNT(COL1) AS ENTRIES FROM TABLE;’
--      ‘SELECT COUNT(DISTINCT COL1) AS ENTRIES FROM TABLE;’





-- 3. Write a query to fetch rows with values ranging from 0 to 2 (assuming the data type to be same as mentioned above)




-- Q5)
-- 1. Find out the number of orders booked and their total purchased amount for each day. The output should be in the below format:
--      a. "For 2001-10-10 there are 15 orders and total amount is Rs.100"
-- 2. Find the total purchase amount at a customer salesman level and rank the salesmen based on the total sales done
-- 3. Find the orders with all the field in such a manner that, the oldest order date will come first and the highest purchase amount of same day will come first





-- Q6)
-- Write a query in SQL to obtain the name of the physicians who are the head of each department. Use the below two tables



















