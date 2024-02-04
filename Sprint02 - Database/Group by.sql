-- join genres กับ tracks
SELECT
 genres.name as genres_name,
 count(*)    as n_song,
 round(avg(bytes * (1024*1024)), 2) as avg_mb,  -- mb = byte * (1024*1024)
 sum(bytes),
 min(bytes),
 max(bytes)
FROM genres
JOIN tracks on genres.genreid = tracks.genreid
GROUP by genres.name
ORDER by 2 DESC -- 2 = column n_song
LIMIT 5;
