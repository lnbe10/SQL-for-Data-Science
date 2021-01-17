--1) How many albums does the artist Led Zeppelin have? 

SELECT COUNT(ArtistId)
FROM albums
WHERE ArtistId = (
    SELECT ArtistId
    FROM artists
    WHERE Name = 'Led Zeppelin'
    );


--2) Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT Title, tracks.UnitPrice
FROM albums
INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
WHERE ArtistId = (SELECT ArtistId
				  FROM artists
				  WHERE Name = "Audioslave");


--3) Find the first and last name of any customer who does not have an invoice.
--   Are there any customers returned from the query?  

SELECT customers.FirstName, customers.LastName
FROM customers
WHERE customers.CustomerId NOT IN
					  (SELECT CustomerId
					   FROM invoices);

-- no


--4) Find the total price for each album.

SELECT albums.Title, SUM(UnitPrice)
FROM tracks JOIN albums ON albums.AlbumId = tracks.AlbumId
GROUP BY albums.AlbumId
HAVING Title = "Big Ones"

-- What is the total price for the album “Big Ones”?
-- 14.85

--5) How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT invoice_items.TrackId
FROM invoices CROSS JOIN invoice_items

-- Only 25 records will be shown in the output so please look at the bottom of the output to see how many records were retrieved.
-- 922880 (never cross join, just if you know exactly what ur doing lol)
