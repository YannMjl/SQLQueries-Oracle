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

-- 4. list the item description and item cost of all items
-- with a cost between $595 and $705.
Select ItemDescription, ItemCost
From item
Where ItemCost between 595 and 705;

-- 5. list the company names and fax numbers of all vendors who have a fax number 
-- listed in the table. Sort the result in descending order by company name. 
Select CompanyName, Fax
From vendor
Where Fax is not Null
Order by CompanyName;