SELECT 
  FORMAT(ROUND(MIN(Pl.price)), 2) AS `faturamento_minimo`,
	FORMAT(ROUND(MAX(Pl.price), 2), 2) AS `faturamento_maximo`,
  FORMAT(ROUND(AVG(Pl.price), 2), 2) AS `faturamento_medio`,
  FORMAT(ROUND(SUM(Pl.price), 2), 2) AS `faturamento_total`
FROM SpotifyClone.Plans AS `Pl`
INNER JOIN SpotifyClone.Users AS `U`
ON `U`.`id_Plan` = `Pl`.`id_Plan`;
