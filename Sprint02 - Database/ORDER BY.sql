-- Order by 
SELECT 
	genres.name,
	count(*) 
FROM genres, tracks
WHERE genres.genreid = tracks.genreid
GROUP BY genres.name
ORDER by COUNT(*) DESC  -- sort จากมากไปน้อย DESC
LIMIT 5;

-- Order by 
SELECT 
	genres.name,
	count(*) 
FROM genres
JOIN tracks ON genres.genreid = tracks.genreid
GROUP BY genres.name
ORDER by COUNT(*) DESC  -- sort จากมากไปน้อย DESC
LIMIT 5;
