SELECT 
  FORMAT(MIN(Pl.price), 2) AS `faturamento_minimo`,
	FORMAT(MAX(Pl.price), 2) AS `faturamento_maximo`,
  FORMAT(AVG(Pl.price), 2) AS `faturamento_medio`,
  FORMAT(SUM(Pl.price), 2) AS `faturamento_total`
FROM SpotifyClone.Plans AS `Pl`
INNER JOIN SpotifyClone.Users AS `U`
ON `U`.`id_Plan` = `Pl`.`id_Plan`;
