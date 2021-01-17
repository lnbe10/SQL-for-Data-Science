--week_3_code_assigment


--1) Using a subquery, find the names of all the tracks for the album "Californication".

SELECT Name
FROM Tracks
WHERE AlbumId = (SELECT AlbumId
				 FROM Albums
				 WHERE Title = "Californication");


-- What is the title of the 8th track?
-- Porcelain (Yes it's right, I know :D)


--2) Find the total number of invoices for each customer along with the customer's full name, city and email.

SELECT Sum(Invoices.InvoiceId), Customers.FirstName, Customers.LastName, Customers.Email 
FROM Customers LEFT JOIN Invoices ON Invoices.CustomerId = Customers.CustomerId
GROUP BY Invoices.CustomerId

-- After running the query described above, what is the email address of the 5th person, František Wichterlová? Enter the answer below (feel free to copy and paste).
-- frantisekw@jetbrains.com


--3) Retrieve the track name, album, artistID, and trackID for all the albums.

SELECT Name, Albums.Title, Albums.ArtistID, TrackId
FROM Tracks JOIN Albums ON Tracks.AlbumId = Albums.AlbumId
WHERE Albums.Title = "For Those About To Rock We Salute You"

-- What is the song title of trackID 12 from the "For Those About to Rock We Salute You" album? Enter the answer below.
-- Breaking The Rules (We Saluuuute Yaaa  \m/ )

--4) Retrieve a list with the managers last name, and the last name of the employees who report to him or her.

SELECT *
FROM Employees

-- After running the query described above, who are the reports for the manager named Mitchell (select all that apply)?
-- King, Callahan


--5) Find the name and ID of the artists who do not have albums. 

SELECT ArtistID, Name
FROM Artists
WHERE Artists.ArtistId NOT IN (SELECT ArtistID
                                FROM Albums)

-- After running the query described above, two of the records returned have the same last name. Enter that name below.
-- Gilberto


--6) Use a UNION to create a list of all the employee's and customer's first names and last names ordered by the last name in descending order.

SELECT Employees.LastName, Employees.FirstName
FROM Employees
UNION
SELECT Customers.LastName, Customers.LastName
FROM Customers
ORDER BY Customers.LastName DESC

-- After running the query described above, determine what is the last name of the 6th record? Enter it below. Remember to order things in descending order to be sure to get the correct answer.
-- Taylor

--7) See if there are any customers who have a different city listed in their billing city versus their customer city.

SELECT CustomerId, City
FROM Customers
WHERE City NOT IN (SELECT BillingCity FROM Invoices)

-- Indicate your answer below.
-- No customers have a different city listed in their billing city versus customer city.

