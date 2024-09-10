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
















