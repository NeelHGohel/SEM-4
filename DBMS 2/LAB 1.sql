--Part – A
--1. Retrieve a unique genre of songs.
SELECT DISTINCT Genre FROM Songs;

--2. Find top 2 albums released before 2010.
SELECT TOP 2 Album_title FROM Albums WHERE Release_year<2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)
INSERT INTO SONGS VALUES (1245 , 'ZAROOR' , 2.55 , 'FELL GOOD' , 1005);
SELECT * FROM SONGS

--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’
UPDATE Songs SET Genre = 'HAPPY' WHERE Genre = 'ZAROOR';

--5. Delete an Artist ‘Ed Sheeran’
DELETE FROM Artists WHERE Artist_name = 'Ed Sheeran';

--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]
ALTER TABLE SONGS ADD Ratings decimal(3,2);

--7. Retrieve songs whose title starts with 'S'.
SELECT * FROM Songs WHERE Song_title LIKE '%S';

--8. Retrieve all songs whose title contains 'Everybody'.
SELECT * FROM Songs WHERE Song_title LIKE '%Everybody%';

--9. Display Artist Name in Uppercase.
SELECT UPPER(Artist_name) AS NAME FROM Artists;

--10. Find the Square Root of the Duration of a Song ‘Good Luck’
SELECT SQRT(Duration) AS SQRT_DURATION FROM Songs;

--11. Find Current Date.
SELECT GETDATE() AS TODAY_DATE;

--12. Find the number of albums for each artist.
SELECT COUNT(Album_id) AS COUNT_OF_ALBUMS FROM Albums 
INNER JOIN Artists
ON Artists.Artist_id = Albums.Artist_id
GROUP BY Artist_name;

--13. Retrieve the Album_id which has more than 5 songs in it.
SELECT Albums.Album_id FROM Albums 
INNER JOIN Songs 
ON Albums.Album_id = Songs.Album_id
GROUP BY Albums.Album_id
HAVING COUNT(Songs.Song_id) > 5;

--14. Retrieve all songs from the album 'Album1'. (using Subquery)
SELECT * FROM Songs WHERE Album_id = (SELECT Album_id FROM Albums WHERE Album_title = 'ALBUM1');


--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)
SELECT * FROM Albums WHERE Artist_id = (SELECT Artist_id FROM Artists WHERE Artist_name = 'Aparshakti Khurana');


--16. Retrieve all the song titles with its album title.
SELECT Songs.Song_title , Albums.Album_title FROM Songs JOIN Albums 
ON Songs.Album_id = Albums.Album_id;

--17. Find all the songs which are released in 2020.
SELECT Songs.Song_title FROM Songs JOIN Albums 
ON Songs.Album_id = Albums.Album_id
WHERE Albums.Release_year = 2009;

--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.
CREATE VIEW FAV_SONGS
AS
SELECT * FROM Songs WHERE Song_id BETWEEN 101 AND 105;
SELECT * FROM FAV_SONGS;

--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.
UPDATE FAV_SONGS
SET Song_title = 'Jannat' WHERE Song_id = 101;
SELECT * FROM FAV_SONGS


--20. Find all artists who have released an album in 2020.
SELECT * FROM Artists INNER JOIN Albums
ON Artists.Artist_id = Albums.Artist_id
WHERE Albums.Release_year = 2020;

--21. Retrieve all songs by Shreya Ghoshal and order them by duration.
SELECT * FROM Songs INNER JOIN Albums
ON Albums.Album_id = Songs.Album_id
INNER JOIN Artists 
ON Artists.Artist_id = Albums.Artist_id
WHERE Artists.Artist_name = 'Shreya Ghoshal';




--Part – B



--22. Retrieve all song titles by artists who have more than one album.
SELECT DISTINCT SONGS.SONG_TITLE, ARTISTS.ARTIST_ID
FROM SONGS 
INNER JOIN ALBUMS ON SONGS.ALBUM_ID = ALBUMS.ALBUM_ID
INNER JOIN ARTISTS ON ARTISTS.ARTIST_ID = ALBUMS.ARTIST_ID
GROUP BY ARTISTS.ARTIST_ID,SONGS.SONG_TITLE
HAVING COUNT(ALBUMS.ALBUM_ID) > 1;


--23. Retrieve all albums along with the total number of songs.
SELECT ALBUMS.ALBUM_TITLE, COUNT(SONGS.SONG_TITLE) AS TOTAL_SONGS
FROM ALBUMS
INNER JOIN SONGS ON ALBUMS.ALBUM_ID = SONGS.ALBUM_ID
GROUP BY ALBUMS.ALBUM_ID,ALBUMS.ALBUM_TITLE;


--24. Retrieve all songs and release year and sort them by release year.
SELECT SONGS.SONG_TITLE, ALBUMS.RELEASE_YEAR
FROM SONGS
INNER JOIN ALBUMS ON SONGS.ALBUM_ID = ALBUMS.ALBUM_ID
ORDER BY ALBUMS.RELEASE_YEAR;


--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.
SELECT Genre, COUNT(Song_title) AS TOTAL_SONGS
FROM Songs
GROUP BY Genre
HAVING COUNT(Song_title) > 2;



--26. List all artists who have albums that contain more than 3 songs.
SELECT Artists.Artist_name
FROM Artists
INNER JOIN Albums ON Artists.Artist_id = Albums.Artist_id
INNER JOIN Songs ON Albums.Album_id = Songs.Album_id
GROUP BY Artists.Artist_id, Albums.Album_id,Artists.Artist_name
HAVING COUNT(Songs.Song_title) > 3;


--Part – C

--27. Retrieve albums that have been released in the same year as 'Album4'
SELECT Albums.Album_title, Albums.Release_year
FROM Albums
WHERE Albums.Release_year = (
    SELECT Albums.Release_year
    FROM Albums
    WHERE Albums.Album_title= 'Album4'
);


--28. Find the longest song in each genre
SELECT Genre, Song_title, MAX(Duration) AS LONGEST_DURATION
FROM Songs
GROUP BY Genre,Song_title;


--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.
SELECT Songs.Song_title
FROM Songs
INNER JOIN Albums ON Songs.Album_id= Albums.Album_id
WHERE Albums.Album_title LIKE '%Album%';


--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.SELECT Artists.Artist_name, SUM(Songs.Duration) AS TOTAL_DURATION
FROM Artists
INNER JOIN Albums ON Artists.Artist_id= Albums.Artist_id
INNER JOIN Songs ON Albums.Album_id = Songs.Album_id
GROUP BY Artists.Artist_id,Artists.Artist_name
HAVING SUM(Songs.Duration) > 15;
