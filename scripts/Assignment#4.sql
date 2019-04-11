-- Assignment #4 - SQL Part 1

-- 1. list all columns for customers with a Seattle address
Select *
From Customer
Where city = 'Seattle';

-- 2.  list all cities where customers live. Make sure the result does not include duplicates
Select Distinct city
From Customer;

-- 3. list the first and last name of all employees who have the last name
-- of Stuart or the first name of John.
Select Firstname, LastName
From employee
Where LastName = 'Stuart' or FirstName = 'John';