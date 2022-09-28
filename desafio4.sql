SELECT
	U.`name` AS 'usuario',
    IF(MAX(YEAR(Ph.release_date_of)) >= 2021,
		'Usuário ativo', 'Usuário inativo') AS 'status_usuario'
FROM SpotifyClone.Users AS `U`
INNER JOIN SpotifyClone.Playback_History AS `Ph`
ON Ph.id_Song = U.id_User
GROUP BY U.`name`
ORDER BY U.`name`;