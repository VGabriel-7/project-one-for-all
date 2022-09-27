SELECT 
	`U`.`name` AS `usuario`,
    COUNT(`PH`.`id_User`) AS `qt_de_musicas_ouvidas`,
    ROUND(SUM(`S`.`length`) / 60, 2) AS `total_minutos`
FROM SpotifyClone.Users AS `U`
INNER JOIN SpotifyClone.Playback_History AS `PH`
ON `PH`.`id_Song` = `U`.`id_User`
INNER JOIN SpotifyClone.Songs AS `S`
ON `S`.`id_Song` = `PH`.`id_User`
GROUP BY `U`.`name` ORDER BY `U`.`name`;