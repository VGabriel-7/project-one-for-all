SELECT
	Songs.Song AS cancao,
    COUNT(PH.id_Song) AS reproducoes
FROM SpotifyClone.Songs AS Songs
INNER JOIN SpotifyClone.Playback_History AS PH
ON PH.id_User = Songs.id_Song
GROUP BY Songs.song having COUNT(PH.id_Song) > 2
ORDER BY Songs.Song;