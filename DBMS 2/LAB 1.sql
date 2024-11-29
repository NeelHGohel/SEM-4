--Part – A
--1. Retrieve a unique genre of songs.
SELECT DISTINCT Genre FROM Songs;

--2. Find top 2 albums released before 2010.
SELECT TOP 2 Album_title FROM Albums WHERE Release_year<2010;

--3. Insert Data into the Songs Table. (1245, ‘Zaroor’, 2.55, ‘Feel good’, 1005)


--4. Change the Genre of the song ‘Zaroor’ to ‘Happy’


--5. Delete an Artist ‘Ed Sheeran’


--6. Add a New Column for Rating in Songs Table. [Ratings decimal(3,2)]


--7. Retrieve songs whose title starts with 'S'.


--8. Retrieve all songs whose title contains 'Everybody'.


--9. Display Artist Name in Uppercase.


--10. Find the Square Root of the Duration of a Song ‘Good Luck’


--11. Find Current Date.


--12. Find the number of albums for each artist.


--13. Retrieve the Album_id which has more than 5 songs in it.


--14. Retrieve all songs from the album 'Album1'. (using Subquery)

--15. Retrieve all albums name from the artist ‘Aparshakti Khurana’ (using Subquery)


--16. Retrieve all the song titles with its album title.


--17. Find all the songs which are released in 2020.


--18. Create a view called ‘Fav_Songs’ from the songs table having songs with song_id 101-105.


--19. Update a song name to ‘Jannat’ of song having song_id 101 in Fav_Songs view.


--20. Find all artists who have released an album in 2020.


--21. Retrieve all songs by Shreya Ghoshal and order them by duration.


--Part – B

--22. Retrieve all song titles by artists who have more than one album.


--23. Retrieve all albums along with the total number of songs.


--24. Retrieve all songs and release year and sort them by release year.


--25. Retrieve the total number of songs for each genre, showing genres that have more than 2 songs.


--26. List all artists who have albums that contain more than 3 songs.


--Part – C

--27. Retrieve albums that have been released in the same year as 'Album4'


--28. Find the longest song in each genre


--29. Retrieve the titles of songs released in albums that contain the word 'Album' in the title.


--30. Retrieve the total duration of songs by each artist where total duration exceeds 15 minutes.