-- Join(inner) table using WHERE
SELECT
 artists.artistid,
 artists.name,
 albums.title
FROM artists, albums
WHERE artists.artistId = albums.artistid 
 AND artists.artistid in (8, 100, 120);
