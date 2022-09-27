SELECT 
	COUNT(Ph.id_Song) AS 'quantidade_musicas_no_historico'
FROM SpotifyClone.Playback_History AS Ph
INNER JOIN SpotifyClone.Users AS U
ON U.id_User = Ph.id_Song
WHERE U.`name` = 'Barbara Liskov';