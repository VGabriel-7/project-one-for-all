DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE `SpotifyClone`.`Plans` (
  `id_Plan` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `Plan` VARCHAR(40) NOT NULL,
  `Price` DOUBLE NULL
  ) ENGINE = InnoDB;
  
  CREATE TABLE `SpotifyClone`.`Users`(
      `id_User` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
      `name` VARCHAR(120) NOT NULL,
      `age` INT,
      `id_Plan` INT NOT NULL,
	  FOREIGN KEY (`id_Plan`)
		REFERENCES `SpotifyClone`.`Plans` (`id_Plan`),
	  `signature_date` DATE NOT NULL
  ) ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`Artists` (
	`id_Artist` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `artist` VARCHAR(60)
) ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`Artist_Followers` (
	`id_User` INT NOT NULL,
    FOREIGN KEY (`id_User`)
		REFERENCES `SpotifyClone`.`Users` (`id_User`),
	`id_Artist` INT NOT NULL,
    FOREIGN KEY (`id_Artist`)
		REFERENCES `SpotifyClone`.`Artists` (`id_Artist`),
    CONSTRAINT PRIMARY KEY (`id_User`, `id_Artist`)
) ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`Albuns` (
	`id_Album` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `album` VARCHAR(45) NOT NULL,
    `id_Artist` INT NOT NULL,
    FOREIGN KEY (`id_Artist`)
		REFERENCES `SpotifyClone`.`Artists` (`id_Artist`),
	`release_year` YEAR NOT NULL
) ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`Songs` (
	`id_Song` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `song` VARCHAR(60) NOT NULL,
    `length` INT NOT NULL,
    `id_Album` INT NOT NULL,
    FOREIGN KEY (`id_Album`)
		REFERENCES `SpotifyClone`.`Albuns` (`id_Album`)
) ENGINE = InnoDB;

CREATE TABLE `SpotifyClone`.`Playback_History` (
	`id_Song` INT NOT NULL,
	FOREIGN KEY (`id_Song`)
		REFERENCES `SpotifyClone`.`Songs` (`id_Song`),
	`id_User` INT NOT NULL,
    FOREIGN KEY (`id_User`)
		REFERENCES `SpotifyClone`.`Users` (`id_User`),
	`release_date_of` DATETIME NOT NULL,
  CONSTRAINT PRIMARY KEY (`id_Song`, `id_User`)
) ENGINE = InnoDB;

INSERT INTO `SpotifyClone`.`Plans` (`Plan`, `Price`)
  VALUES
    ('gratuito', 0.00),
    ('pessoal', 5.99),
    ('universitário', 6.99),
    ('familiar', 7.99);

INSERT INTO `SpotifyClone`.`Users` (`name`, `age`, `id_Plan`, `signature_date`)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 3, '2018-02-14'),
    ('Bell Hooks', 26, 3, '2018-01-05'),
    ('Christopher Alexander', 85, 2, '2019-06-05'),
    ('Judith Butler', 45, 2, '2020-05-13'),
    ('Jorge Amado', 58, 2, '2017-02-17');
    
INSERT INTO `SpotifyClone`.`Artists` (`artist`)
    VALUES 
		('Beyoncé'),
		('Queen'),
		('Elis Regina'),
		('Baco Exu do Blues'),
		('Blind Guardian'),
		('Nina Simone');

INSERT INTO `SpotifyClone`.`Artist_Followers` (`id_User`, `id_Artist`)
	VALUES 
		(1, 1),
        (1, 2),
        (1, 3),
        (2, 1),
        (2, 3),
        (3, 2),
        (4, 4),
        (5, 5),
        (5, 6),
        (6, 6),
        (6, 1),
        (7, 6),
        (9, 3),
        (10, 2);
        
INSERT INTO `SpotifyClone`.`Albuns` (`album`, `id_Artist`, `release_year`)
	VALUES
		('Renaissance', 1, '2022'),
        ('Jazz', 2,'1978'),
        ('Hot Space', 2, '1982'),
        ('Falso Brilhante', 3, '1998'),
        ('Vento de Maio', 3, '2001'),
        ('QVVJFA?', 4, '2003'),
        ('Somewhere Far Beyond', 5, '2007'),
        ('I Put A Spell On You', 6, '2012');
    
INSERT INTO `SpotifyClone`.`Songs` (`song`, `length`, `id_Album`) 
	VALUES
		('BREAK MY SOUL', 279, 1),
        ('VIRGO’S GROOVE', 369, 1),
        ('ALIEN SUPERSTAR', 116, 1),
        ('Don’t Stop Me Now', 203, 2),
        ('Under Pressure', 152, 3),
        ('Como Nossos Pais', 105, 4),
        ('O Medo de Amar é o Medo de Ser Livre', 207, 5),
        ('Samba em Paris', 267, 6),
        ('The Bard’s Song', 244, 7),
        ('Feeling Good', 100, 8);

INSERT INTO `SpotifyClone`.`Playback_History` (`id_Song`, `id_User`, `release_date_of`)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');
    