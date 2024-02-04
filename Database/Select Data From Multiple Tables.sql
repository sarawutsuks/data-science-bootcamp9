SELECT
  t1.artistid,
  t1.name AS artis_name,
  t2.title AS album_nmae,
  t3.name AS track_name,
  t3.composer
FROM
  artists AS t1
  JOIN albums AS t2 ON t1.ArtistId = t2.artistid -- pk = fk
  JOIN tracks AS t3 ON t2.albumid = t3.albumid;
_________________________________________________________________________________

SELECT
  t1.artistid,
  t1.name AS artis_name,
  t2.title AS album_nmae,
  t3.name AS track_name,
  t3.composer,
  t4.name AS genres_name
FROM
  artists AS t1
  JOIN albums AS t2 ON t1.ArtistId = t2.artistid -- pk = fk
  JOIN tracks AS t3 ON t2.albumid = t3.albumid
  JOIN genres AS t4 ON t3.genreid = t4.genreid
WHERE lower(t4.name) IN ('rock', 'jazz') AND t1.name LIKE 'the%';
