SELECT 
	A.artist AS `artista`,
    Al.album AS `album`,
    COUNT(Af.id_Artist) AS `seguidores`
FROM SpotifyClone.Artists AS `A`
INNER JOIN SpotifyClone.Albuns AS `Al`
ON `Al`.`id_Artist` = `A`.`id_Artist`
INNER JOIN SpotifyClone.Artist_Followers AS `Af`
ON `Af`.`id_Artist` = `A`.`id_Artist`
GROUP BY A.artist, Al.album, Af.id_Artist
ORDER BY seguidores DESC, artista ASC, album ASC;