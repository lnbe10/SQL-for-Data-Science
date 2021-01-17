--1) Pull a list of customer ids with the customer’s full name, and address, along with combining their city and country together. Be sure to make a space in between these two and make it UPPER CASE. (e.g. LOS ANGELES USA)

SELECT CustomerId, UPPER(FirstName|| ' '|| LastName), UPPER(City || ", "|| Country)
FROM Customers
WHERE CustomerId = 16

-- What is the city and country result for CustomerID 16?
-- MOUNTAIN VIEW USA

--2) Create a new employee user id by combining the first 4 letters of the employee’s first name with the first 2 letters of the employee’s last name. Make the new field lower case and pull each individual step to show your work.

SELECT SUBSTR(FirstName, 1, 4)||SUBSTR(LastName,1,2)
FROM Employees
WHERE FirstName = 'Robert' AND LastName = 'King'

-- What is the final result for Robert King?
-- RobeKi


--3) Show a list of employees who have worked for the company for 15 or more years using the current date function. Sort by lastname ascending.

SELECT FirstName, LastName, DATE(('now') - HireDate)
FROM Employees

-- What is the lastname of the last person on the list returned?
-- Callahan 
-- I got problems with DATE function here...

--4) Profiling the Customers table, answer the following question.

SELECT *
FROM Customers
WHERE(CustomerId IS  NULL OR
      FirstName IS  NULL OR
      LastName IS  NULL OR
      Company IS NULL OR
      Address IS NULL OR
      City IS  NULL OR
      State IS NULL OR
      Country IS  NULL OR
      PostalCode IS  NULL OR
      Phone IS  NULL OR
      FAX IS  NULL OR
      Email IS  NULL OR
      SupportRepId IS  NULL)

-- Are there any columns with null values? Indicate any below. Select all that apply.

-- Searching One Collum at once:
-- (Company, Phone, Fax, PostalCode)


--5) Find the cities with the most customers and rank in descending order.

SELECT City, Count(*) AS Living
FROM Customers
GROUP BY City
HAVING Living = 2
ORDER BY Living DESC

-- Which of the following cities indicate having 2 customers?
-- São Paulo, London, Mountain View
-- (Berlin, Paris, Prague) not listed
-- (Budapest, Frankfut, Dublin) listed but with only 1


--6) Create a new customer invoice id by combining a customer’s invoice id with their first and last name while ordering your query in the following order: firstname, lastname, and invoiceID.

SELECT Customers.FirstName||Customers.LastName||InvoiceId , Customers.FirstName, Customers.LastName, Invoices.InvoiceId
FROM Invoices JOIN Customers ON Customers.CustomerId = Invoices.CustomerId
ORDER BY Customers.FirstName, Customers.LastName, Invoices.InvoiceId

-- Select all of the correct "AstridGruber" entries that are returned in your results below. Select all that apply.
-- AstridGruber(273,296,370)