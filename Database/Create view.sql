-- virtual table <- view 

CREATE VIEW genre_stat AS
  SELECT
      genres.name,
      COUNT(*) as COUNT_tracks,
      round(avg(milliseconds) / 60000.0, 2) as mb
  FROM artists
  	JOIN albums on artists.artistid = albums.artistid  -- default inner join
  	JOIN tracks on albums.albumid = tracks.albumid
  	JOIN genres on tracks.genreid = genres.genreid
  GROUP BY 1
  HAVING genres.name LIKE "%a%"
  ORDER BY avg(milliseconds) DESC
  LIMIT 10;
  
  -------------------------------------------
  
  SELECT * FROM genre_stat;  -- view จะ run code เมื่อ data ถูก update view จะ update ด้วย 
  
  -------------------------------------------
  
  DROP VIEW genre_stat;  -- delete view
   
   
  
  
  
  
