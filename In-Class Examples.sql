/* Q1-Q3 */
SELECT InvoiceNumber, InvoiceDate, Total
FROM INVOICE
WHERE Total > 60
ORDER BY InvoiceDate;

/* Q4-Q5 */
SELECT InvoiceDate, SUM(Total)
FROM INVOICE
GROUP BY InvoiceDate
HAVING SUM(Total) > 100;

/* Customers with purchases over $50 using Subquery */
SELECT FirstName, LastName
FROM CUSTOMER
WHERE CustomerID IN
    (SELECT CustomerID
     FROM INVOICE
     WHERE Total > 50);

/* Same as above, but joining in WHERE clause */
SELECT DISTINCT FirstName, LastName
FROM CUSTOMER c, INVOICE i
WHERE c.CustomerID = i.CustomerID
        AND Total > 50;

/* Same as above, but joining in FROM clause */
SELECT DISTINCT FirstName, LastName
FROM CUSTOMER JOIN INVOICE ON CUSTOMER.CustomerId = INVOICE.CustomerId
WHERE Total > 50;

/* Same as above, but joining in FROM clause and using aliases */
SELECT DISTINCT FirstName, LastName
FROM CUSTOMER c JOIN INVOICE i ON c.CustomerId = i.CustomerId
WHERE Total > 50;


/* Same but joining on WHERE clause */
SELECT InvoiceNumber, PRODUCT.ProductNumber, Quantity
FROM LINE_ITEM, PRODUCT
WHERE ProductType = 'Video' 
        AND LINE_ITEM.ProductNumber = PRODUCT.ProductNumber;

/* Same but with a subquery */
SELECT InvoiceNumber, ProductNumber, Quantity
FROM LINE_ITEM
WHERE ProductNumber IN 
        (SELECT ProductNumber
         FROM PRODUCT
         WHERE ProductType = 'Video');
         
/* List the InvoiceNumber, ProductNumber and Quantity for Videos (videos are a producttype of Products) */
SELECT InvoiceNumber, PRODUCT.ProductNumber, Quantity
FROM LINE_ITEM JOIN PRODUCT ON LINE_ITEM.ProductNumber = PRODUCT.ProductNumber
WHERE ProductType = 'Video';
         

/* List customer first and last names, invoice numbers, and invoice totals
    and include all customers, even those without invoices */
SELECT FirstName, LastName, InvoiceNumber, Total
FROM CUSTOMER LEFT JOIN INVOICE ON CUSTOMER.CustomerId = INVOICE.CustomerID;

/* Same thing but RIGHT join */
SELECT FirstName, LastName, InvoiceNumber, Total
FROM INVOICE RIGHT JOIN CUSTOMER ON CUSTOMER.CustomerId = INVOICE.CustomerID;


/* List customer names of customers who have purchased videos (producttype in Product) */
SELECT DISTINCT FirstName, LastName
FROM CUSTOMER JOIN INVOICE ON CUSTOMER.CustomerId = INVOICE.CustomerID
              JOIN LINE_ITEM ON LINE_ITEM.InvoiceNumber = INVOICE.InvoiceNumber
              JOIN PRODUCT ON PRODUCT.ProductNumber = LINE_ITEM.ProductNumber
WHERE ProductType = 'Video';


-- *********************************************************************************************************
-- Create tables statments                                                                                 *
-- *********************************************************************************************************

-- Create customer table
CREATE TABLE Customer (
        CustomerID      INT             NOT NULL,
        Lastname        VARCHAR(20)     NOT NULL,
        FirstName       VARCHAR(20)     NOT NULL,
        CONSTRAINT CustomerPK PRIMARY KEY (CustomerID)
);

CREATE TABLE Invoice (
        InvoiceNumber   INT             NOT NULL,
        InvoiceDate     DATE            NOT NULL,
        CustomerID      INT             NOT NULL,
        PaymentType     VARCHAR(15)     NOT NULL,
    
        CONSTRAINT InvoicePK PRIMARY KEY (InvoiceNumber),
        CONSTRAINT CustomerID_FK FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
        CONSTRAINT PaymentTypeCheck CHECK (PaymentType IN ('Visa', 'Cash', 'MasterCard', 'Check')
);

-- *********************************************************************************************************
-- Alter tables statments                                                                                  *
-- *********************************************************************************************************

ALTER TABLE CUSTOMER 
    ADD     City    VARCHAR(20)     NULL;
    
ALTER TABLE CUSTOMER 
    -- Check that the city where our customer live are only Dallas, San Antonie, and Auston
    ADD     CONSTRAINT CityOptions CHECK (City IN ('Dallas', 'San Antonio', 'Auston'));

