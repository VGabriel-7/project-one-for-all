SELECT
	COUNT(`id_Song`) AS `cancoes`,
    (SELECT COUNT(`id_Artist`) FROM SpotifyClone.Artists) AS `artistas`,
    (SELECT COUNT(`id_Album`) FROM SpotifyClone.Albuns) AS `albuns`
FROM SpotifyClone.Songs;