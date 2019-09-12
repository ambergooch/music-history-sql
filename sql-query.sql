-- Query all of the entries in the Genre table

SELECT "GenreId", "Label" 
FROM Genre;

-- Query Song Table for Title and SongLength

SELECT "Title", "SongLength"
FROM Song;

-- Using the INSERT statement, add one of your favorite artists to the Artist table.

INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (null, "Joe Lizzo", 2019);

INSERT INTO Artist (ArtistId, ArtistName, YearEstablished)
VALUES (null, "Local Natives", 2009);

-- Using the INSERT statement, add one, or more, albums by your artist to the Album table.

INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "Lizard", "9/12/2019", 2871, "Columbia", 28, 14);

INSERT INTO Album (AlbumId, Title, ReleaseDate, AlbumLength, Label, ArtistId, GenreId)
VALUES (null, "Gorilla Manor", "05/06/2011", 2207, "Warner", 29, 2);

UPDATE Album
SET ReleaseDate = "09/12/2019"
WHERE AlbumId = 23;

UPDATE Album
SET Label = "Warner Bros."
WHERE AlbumId = 25;

DELETE
FROM Album
WHERE AlbumId = 24;

-- Using the INSERT statement, add some songs that are on that album to the Song table.

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Mojo Jojo", 135, "09/12/2019", 14, 28, 23);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Tempo of Typing", 287, "09/12/2019", 14, 28, 23);

INSERT INTO Song (SongId, Title, SongLength, ReleaseDate, GenreId, ArtistId, AlbumId)
VALUES (null, "Wide Eyes", 243, "05/06/2011", 2, 29, 25);

-- Write a SELECT query that provides the song titles, album title, and artist name for all of the data you just entered in. Use the LEFT JOIN keyword sequence to connect the tables, and the WHERE keyword to filter the results to the album and artist you added.
-- Reminder: Direction of join matters. Try the following statements and see the difference in results.
-- SELECT a.Title, s.Title FROM Album a LEFT JOIN Song s ON s.AlbumId = a.AlbumId;
-- SELECT a.Title, s.Title FROM Song s LEFT JOIN Album a ON s.AlbumId = a.AlbumId;

SELECT Song.Title, Album.Title, Artist.ArtistName
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId
LEFT JOIN Artist
ON Song.ArtistId = Artist.ArtistId
WHERE Song.AlbumId = 23;

-- Write a SELECT statement to display how many songs exist for each album. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(SongId) AS "Song Count", Album.Title
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId
GROUP BY Song.AlbumId;


-- Write a SELECT statement to display how many songs exist for each artist. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(SongId) AS "Song Count", Artist.ArtistName
FROM Song
LEFT JOIN Artist
ON Song.ArtistId = Artist.ArtistId
GROUP BY Song.ArtistId;

-- Write a SELECT statement to display how many songs exist for each genre. You'll need to use the COUNT() function and the GROUP BY keyword sequence.

SELECT COUNT(SongId) AS "Song Count", Genre.Label
FROM Song
LEFT JOIN Genre
ON Song.GenreId = Genre.GenreId
GROUP BY Song.GenreId;

-- Using MAX() function, write a select statement to find the album with the longest duration. The result should display the album title and the duration.

SELECT "Title", MAX("AlbumLength") AS "Album Length"
FROM Album;

-- Using MAX() function, write a select statement to find the song with the longest duration. The result should display the song title and the duration.

SELECT "Title", MAX("SongLength") AS "Song Length"
FROM Song;

-- Modify the previous query to also display the title of the album.

SELECT Song.Title AS "Song Title", Album.Title AS "Album Title", MAX(Song.SongLength) AS "Album Length"
FROM Song
LEFT JOIN Album
ON Song.AlbumId = Album.AlbumId;
