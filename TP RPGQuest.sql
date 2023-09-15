CREATE database rpgquest;

CREATE TABLE classes (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50) NOT NULL,
   pointsvie INT NOT NULL,
   pointmagie INT NOT NULL
);

-- Table "armes"
CREATE TABLE armes (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50) NOT NULL,
   type ENUM('corpsacorps', 'distance', 'magique') NOT NULL,
   `force` INT NOT NULL,
   magie INT NOT NULL
);

-- Table "armures"
CREATE TABLE armures (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50) NOT NULL,
   defense INT NOT NULL
);

-- Table "personnages"
CREATE TABLE personnages (
   id INT AUTO_INCREMENT PRIMARY KEY,
   nom VARCHAR(50) NOT NULL,
   niveau INT NOT NULL,
   PointsVie INT NOT NULL,
   PointsMagie INT NOT NULL,
   `force` INT NOT NULL,
   magie INT NOT NULL,
   defense INT NOT NULL,
   armure INT NOT NULL,
   arme INT NOT NULL,
   classe INT NOT NULL,
   FOREIGN KEY (armure) REFERENCES armures(id),
   FOREIGN KEY (arme) REFERENCES armes(id),
   FOREIGN KEY (classe) REFERENCES classes(id)
);


INSERT INTO classes (id, nom, pointsvie, pointmagie) VALUES
(1, 'Guerrier', 100, 10),
(2, 'Mage', 60, 30),
(3, 'Voleur', 70, 5),
(4, 'Archer', 80, 5),
(5, 'Paladin', 120, 5);

-- Enregistrements pour la table "armes"
INSERT INTO armes (id, nom, type, `force`, magie) VALUES
(1, 'Épée', 'corpsacorps', 15, 0),
(2, 'Bâton de magicien', 'magique', 2, 12),
(3, 'Arc long', 'distance', 10, 0),
(4, 'Dague', 'corpsacorps', 8, 0),
(5, 'Arc court', 'distance', 5, 0);

-- Enregistrements pour la table "armures"
INSERT INTO armures (id, nom, defense) VALUES
(1, 'Armure de Fer', 15),
(2, 'Robe de Mage', 5),
(3, 'Armure de cuir', 10),
(4, 'Plastron', 20),
(5, 'Tunique', 2);

-- Enregistrements pour la table "personnages" avec des pseudonymes fictifs
INSERT INTO personnages (id, nom, niveau, PointsVie, PointsMagie, `force`, magie, defense, armure, arme, classe) VALUES
(1, 'Sirius', 5, 100, 10, 15, 5, 15, 1, 1, 1),
(2, 'Luna', 4, 60, 30, 2, 12, 5, 2, 2, 2),
(3, 'Sylas', 6, 70, 5, 10, 0, 10, 3, 4, 3),
(4, 'Eldarion', 5, 80, 5, 12, 0, 5, 5, 3, 4),
(5, 'Aurora', 7, 120, 5, 18, 0, 20, 4, 1, 5),
(6, 'Luther', 8, 150, 5, 20, 0, 18, 1, 1, 1),
(7, 'Aria', 6, 70, 45, 5, 18, 8, 2, 2, 2),
(8, 'Thorne', 7, 90, 15, 14, 5, 12, 3, 4, 3),
(9, 'Riven', 6, 85, 5, 13, 0, 7, 4, 3, 4),
(10, 'Seraphina', 9, 180, 20, 22, 0, 22, 5, 1, 5),
(11, 'Faelan', 5, 110, 10, 16, 0, 15, 1, 1, 1),
(12, 'Elowen', 8, 75, 50, 4, 20, 5, 2, 2, 2),
(13, 'Cassius', 7, 75, 5, 12, 0, 10, 3, 4, 3),
(14, 'Lyanna', 6, 70, 5, 11, 0, 8, 4, 3, 4),
(15, 'Darian', 9, 200, 5, 24, 0, 20, 5, 1, 5),
(16, 'Eirik', 6, 120, 5, 17, 0, 15, NULL, 1, 1),
(17, 'Sylas', 7, 85, 55, 5, 22, 6, 2, 2, 2),
(18, 'Kael', 7, 90, 5, 13, 0, 11, 3, 4, 3),
(19, 'Soren', 6, 80, 5, 14, 0, 9, 4, 3, 4),
(20, 'Evelyn', 9, 190, 10, 23, 0, 19, 5, 1, 5),
(21, 'Thrain', 6, 130, 5, 18, 0, 16, 1, 1, 1),
(22, 'Isolde', 8, 95, 60, 5, 24, 7, 2, 2, 2),
(23, 'Rowan', 7, 80, 5, 15, 0, 13, 3, 4, 3),
(24, 'Elara', 6, 75, 5, 12, 0, 10, 4, 3, 4),
(25, 'Caelum', 10, 210, 15, 26, 0, 24, 5, 1, 5);



CREATE OR REPLACE VIEW v_personnages AS SELECT personnages.id, personnages.nom, classes.nom AS classe, personnages.niveau,
       personnages.pointsVie, personnages.pointsMagie,
       personnages.force, personnages.magie, personnages.defense,
       armes.nom AS arme, armures.nom AS armure
FROM personnages LEFT JOIN classes ON classes.id=personnages.classe
                    LEFT JOIN armes ON armes.id=personnages.arme
                    LEFT JOIN armures ON armures.id=personnages.armure

GRANT SELECT ON armures TO 'sio1-tp3'@'%';

UPDATE personnages SET armure=NULL WHERE id=16;
