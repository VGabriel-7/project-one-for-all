SELECT 
	A.artist AS 'artista',
    Al.album AS 'album'
FROM SpotifyClone.Albuns AS Al
LEFT JOIN SpotifyClone.Artists AS A
ON A.id_Artist = Al.id_Artist
WHERE A.artist = 'Elis Regina';