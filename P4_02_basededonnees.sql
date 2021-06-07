
CREATE TABLE plat (
                idPlat INT AUTO_INCREMENT NOT NULL,
                nomPlat VARCHAR(20) NOT NULL,
                prix DECIMAL(5) NOT NULL,
                PRIMARY KEY (idPlat)
);


CREATE TABLE client (
                idClient INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(20) NOT NULL,
                prenom VARCHAR(20) NOT NULL,
                mail VARCHAR(320) NOT NULL,
                telephone VARCHAR(15) NOT NULL,
                motDePasse VARCHAR(50) NOT NULL,
                PRIMARY KEY (idClient)
);


CREATE TABLE adresse (
                idAdresse INT AUTO_INCREMENT NOT NULL,
                idClient INT NOT NULL,
                numero SMALLINT NOT NULL,
                rue VARCHAR(40) NOT NULL,
                ville VARCHAR(38) NOT NULL,
                codePostal NUMERIC(5) NOT NULL,
                batiment VARCHAR(10),
                etage SMALLINT,
                digicode VARCHAR(10),
                PRIMARY KEY (idAdresse)
);


CREATE TABLE selection_client (
                idSelectionClient INT AUTO_INCREMENT NOT NULL,
                idPlat INT NOT NULL,
                idClient INT NOT NULL,
                quantiteCommandee SMALLINT NOT NULL,
                PRIMARY KEY (idSelectionClient)
);


CREATE TABLE livreur (
                idLivreur INT AUTO_INCREMENT NOT NULL,
                nom VARCHAR(20) NOT NULL,
                prenom VARCHAR(20) NOT NULL,
                telephone VARCHAR(15) NOT NULL,
                positionX VARCHAR(50) NOT NULL,
                positionY VARCHAR(50) NOT NULL,
                statut VARCHAR(15) NOT NULL,
                PRIMARY KEY (idLivreur)
);


CREATE TABLE stock_livreur (
                idLivreur INT NOT NULL,
                idPlat1 INT NOT NULL,
                idPlat2 INT NOT NULL,
                quantitePlat1 SMALLINT,
                quantitePlat2 SMALLINT,
                PRIMARY KEY (idLivreur)
);


CREATE TABLE statut_livreur (
                idLivreur INT NOT NULL,
                statut VARCHAR(15) NOT NULL,
                misAJour DATE NOT NULL,
                PRIMARY KEY (idLivreur)
);


CREATE TABLE commande (
                idCommande INT AUTO_INCREMENT NOT NULL,
                idClient INT NOT NULL,
                idSelectionClient INT NOT NULL,
                idLivreur INT NOT NULL,
                idAdresse INT NOT NULL,
                dateCommande DATE NOT NULL,
                statutCommande VARCHAR(15) NOT NULL,
                PRIMARY KEY (idCommande)
);


CREATE TABLE statut_commande (
                idCommande INT NOT NULL,
                statut VARCHAR(15) NOT NULL,
                misAJour DATE NOT NULL,
                PRIMARY KEY (idCommande)
);


ALTER TABLE stock_livreur ADD CONSTRAINT plat_stock_livreur_fk
FOREIGN KEY (idPlat1)
REFERENCES plat (idPlat)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE selection_client ADD CONSTRAINT plat_selection_client_fk
FOREIGN KEY (idPlat)
REFERENCES plat (idPlat)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT client_commande_fk
FOREIGN KEY (idClient)
REFERENCES client (idClient)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE selection_client ADD CONSTRAINT client_selection_client_fk
FOREIGN KEY (idClient)
REFERENCES client (idClient)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE adresse ADD CONSTRAINT client_adresse_fk
FOREIGN KEY (idClient)
REFERENCES client (idClient)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE selection_client ADD CONSTRAINT adresse_selection_client_fk
FOREIGN KEY (idAdresse)
REFERENCES adresse (idAdresse)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT selection_client_commande_fk
FOREIGN KEY (idSelectionClient)
REFERENCES selection_client (idSelectionClient)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE commande ADD CONSTRAINT livreur_commande_fk
FOREIGN KEY (idLivreur)
REFERENCES livreur (idLivreur)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE statut_livreur ADD CONSTRAINT livreur_statut_livreur_fk
FOREIGN KEY (idLivreur)
REFERENCES livreur (idLivreur)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE stock_livreur ADD CONSTRAINT livreur_stock_livreur_fk
FOREIGN KEY (idLivreur)
REFERENCES livreur (idLivreur)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE statut_commande ADD CONSTRAINT commande_statut_commande_fk
FOREIGN KEY (idCommande)
REFERENCES commande (idCommande)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
