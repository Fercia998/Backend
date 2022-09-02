CREATE DATABASE shop;

USE shop

--SELECT User, Host FROM mysql.user;
--FLUSH PRIVILLEGES;

CREATE USER 'someuser'@'localhost' IDENTIFIED BY 'somepassword';

CREATE TABLE `clients` (
  `id_Client` int(10) NOT NULL AUTO_INCREMENT,
  `nom` varchar(200) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `contact` int(11) NOT NULL,
  `ville` varchar(45) NOT NULL,
  PRIMARY KEY (`id_Client`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `Commandes` (
  `id_Commande` int(10) NOT NULL AUTO_INCREMENT,
  `id_Client` int(10) NOT NULL,
  `date` varchar(10) NOT NULL,
  PRIMARY KEY (`id_Commande`),
  INDEX par_ind (`id_Client`),
    FOREIGN KEY (`id_Client`)
        REFERENCES clients(`id_Client`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `Marques` (
  `id_Marque` INT NOT NULL AUTO_INCREMENT,
  `marque` varchar(50) NOT NULL,
  `logo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_Marque`)
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `chaussures` (
  `id_chaussure` int(10) NOT NULL AUTO_INCREMENT,
  `id_Marque` int(10) NOT NULL,
  `taille` int(2) NOT NULL,
  `couleur` varchar(50) NOT NULL,
  `prix` float NOT NULL,
  `nom_chaussure` varchar(25) NOT NULL,
  PRIMARY KEY (`id_chaussure`),  
  INDEX par_ind (`id_Marque`),
    FOREIGN KEY (`id_Marque`)
        REFERENCES marques(`id_Marque`)
        ON DELETE CASCADE
) ENGINE=Innodb DEFAULT CHARSET=utf8;


CREATE TABLE `liste_produits` (
  `id_Commande` int(10) NOT NULL AUTO_INCREMENT,
  `id_chaussure` int(10) NOT NULL,
  `quantite` int(3) NOT NULL,
  PRIMARY KEY (`id_Commande`),
  INDEX par_ind (`id_chaussure`),
    FOREIGN KEY (`id_chaussure`)
        REFERENCES chaussures(`id_Chaussure`)
        ON DELETE CASCADE
  
) ENGINE=Innodb DEFAULT CHARSET=utf8;


INSERT INTO `Marques` (`id_Marque`, `marque`, `logo`) VALUES
(1, 'Nike', 'LogoNike'),
(2, 'Adidas', 'LogoAdidas'),
(3, 'Vans', 'LogoVans');


INSERT INTO `chaussures` (`id_chaussure`, `id_Marque`, `taille`, `couleur`, `prix`, `nom_chaussure`) VALUES
(1, 3, 39, 'rouge', 40000, 'Stan_Smith'),
(2, 1, 32, 'gris', 50000, 'Yezi'),
(3, 2, 45, 'Jaune', 30000, 'Vansb');



-- Sppression de la Stan_Smith
DELETE FROM chaussures WHERE id_chaussure = 1;  

-- mise a jour de la Stan_Smith
UPDATE chaussures SET nom_chaussure = 'Stan_smith02' WHERE id_chaussure = 1;

-- Liste des marques
SELECT marque FROM marques;