CREATE OR REPLACE TYPE typAdresse AS OBJECT
(
	Numero number(10),
	NomVoie varchar2(100)
);
/


CREATE OR REPLACE TYPE typVille AS OBJECT(
    Nom varchar2(100),
    CP number(5),
    ZoneHoraire number(2) 
);
/

CREATE TABLE Ville OF typVille(
	PRIMARY KEY(Nom),
	CP NOT NULL,
	ZoneHoraire NOT NULL,
	CONSTRAINT CP_key UNIQUE (CP),
    CONSTRAINT ZoneHor_ok CHECK (ZoneHoraire >= -12 AND ZoneHoraire <= 12)
);
/


CREATE OR REPLACE TYPE Hotel AS OBJECT
(
	Nom varchar2(100),
	Adresse typAdresse,
	Ville varchar2(100),
	PrixNuit numeric
);
/

CREATE OR REPLACE TYPE listeHotels AS TABLE OF Hotel;
/


CREATE OR REPLACE TYPE typGare AS OBJECT(
    Nom varchar2(100),
	Adresse typAdresse,
    refVille varchar2(100),
    Hotels listeHotels
);
/

CREATE TABLE Gare OF typGare(
    Nom NOT NULL,
	Adresse NOT NULL,
    refVille NOT NULL,
    PRIMARY KEY (Nom,refVille),
	CONSTRAINT Ville_fkey 
    FOREIGN KEY (refVille) 
    REFERENCES Ville(Nom)
)
NESTED TABLE Hotels STORE AS tabDesHotels;
/


CREATE OR REPLACE TYPE typTypeTrain AS OBJECT
(
	Nom varchar2(100),
	nbPlacesPrem number,
	nbPlacesSec	number,
	vitesseMax number
);
/

CREATE TABLE TypeTrain OF typTypeTrain
(
	PRIMARY KEY (nom),
	nbPlacesPrem NOT NULL,
	nbPlacesSec NOT NULL,
	vitesseMax NOT NULL,
	CONSTRAINT nbPlacesPrem_pos CHECK (nbPlacesPrem >= 0),
	CONSTRAINT nbPlacesSec_pos CHECK (nbPlacesSec > 0),
	CONSTRAINT vitesseMax_pos CHECK (vitesseMax > 0)
);
/


CREATE OR REPLACE TYPE typLigne AS OBJECT
(
	numero number,
	GareDep REF typGare,
	GareArr REF typGare,
	TypeTrain varchar2(100)
);
/

CREATE TABLE Ligne OF typLigne
(
	PRIMARY KEY(numero),
	SCOPE FOR (GareDep) IS Gare,
	SCOPE FOR (GareArr) IS Gare,
    CONSTRAINT Depart_arrivee_diff CHECK (GareDep <> GareArr),
	CONSTRAINT Id_diff_0 CHECK (numero <> 0)
);
/


CREATE OR REPLACE TYPE typPlanning AS OBJECT
(
	Nom varchar2(100),
	Jours varchar2(7), --je n'ai pas trouvé comment faire un tableau de 7 boolean avec oracle
    Debut date,
    Fin date
);
/

CREATE TABLE Planning OF typPlanning
(
	PRIMARY KEY(Nom),
	Jours NOT NULL,
    CONSTRAINT Donnees_key UNIQUE (Jours, Debut, Fin),
    CONSTRAINT Debut_avant_fin CHECK (Debut <= Fin)
);
/

CREATE OR REPLACE TYPE typException AS OBJECT
(
	numero number,
	Nom varchar2(100),
	refPlanning REF typPlanning,
	Ajoute  number(1), --pas de boolean en oracle
	DateDebut date,
	DateFin date
);
/

CREATE TABLE Exceptions OF typException
(
	PRIMARY KEY (numero),
	refPlanning NOT NULL,
	Ajoute NOT NULL,
	SCOPE FOR (refPlanning) IS Planning,
	CONSTRAINT DateDebutInferieurDateFin CHECK (DateDebut<=DateFin),
	numero NOT NULL
);
/

CREATE OR REPLACE
TYPE typTrajet AS OBJECT
(
	numero number,
	refLigne REF typLigne,
	HeureDepart DATE,-- marche qu'en version 9 : INTERVAL HOUR(2) TO SECOND(2),
	HeureArrivee DATE,-- marche qu'en version 9 : INTERVAL HOUR(2) TO SECOND(2),
	PrixPrem numeric(5,2),
	PrixSec numeric(5,2),
	refPlanning REF typPlanning
);
/

CREATE TABLE Trajet OF typTrajet
(
	PRIMARY KEY (numero),
	SCOPE FOR(refLigne) IS Ligne,
	HeureDepart NOT NULL,
	HeureArrivee NOT NULL,
	PrixSec NOT NULL,
	SCOPE FOR (refPlanning) IS Planning,
	CONSTRAINT Arrivee_apres_depart CHECK (HeureDepart < HeureArrivee),
	CONSTRAINT PrixSec_pos CHECK (PrixSec > 0),
	CONSTRAINT PrixPrem_pos CHECK (PrixPrem > 0),
	numero NOT NULL
);
/

CREATE OR REPLACE TYPE typVoyageur AS OBJECT
(
	numero number,
	Nom varchar2(100),
	Prenom varchar2(100),
	NumeroTel number(10),
    TypeVoyageur varchar(20),
	NumeroCarte number(12),
    Adresse typAdresse,
	refVille REF typVille
);
/


CREATE TABLE Voyageur OF typVoyageur
(
	PRIMARY KEY(numero),
	Nom NOT NULL,
	Prenom NOT NULL,
    SCOPE FOR (refVille) IS Ville,
	CONSTRAINT NumeroCarte_key UNIQUE (NumeroCarte),
	CONSTRAINT NumeroTel_key UNIQUE (NumeroTel),
	numero NOT NULL,
	CONSTRAINT enumTypeVoyageur TypeVoyageur CHECK (TypeVoyageur IN ('Occasionnel', 'Argent', 'Or', 'Platine'))
);
/


CREATE OR REPLACE TYPE typReservation AS OBJECT
(
	numero number,
	refVoyageur REF typVoyageur,
	Assurance number(1),
	MoyenPaiement varchar2(20)
);
/

CREATE TABLE Reservation OF typReservation
(
	PRIMARY KEY(numero),
	refVoyageur NOT NULL,
	SCOPE FOR (refVoyageur) IS Voyageur,
	Assurance NOT NULL,
	MoyenPaiement NOT NULL CHECK (MoyenPaiement IN ('especes', 'cheque', 'carte_bleue'))
);
/

CREATE TABLE Billet
(
	numero number PRIMARY KEY,
	dateDepart DATE NOT NULL,
	Classe varchar2(1) NOT NULL check(Classe IN ('1', '2')),
	Place number,
	Annule number(1) NOT NULL,
	refTrajet REF typTrajet NOT NULL,
	SCOPE FOR (refTrajet) IS Trajet,
	refReservation REF typReservation,
	SCOPE FOR (refReservation) IS Reservation,
	CONSTRAINT Place_pos CHECK (Place > 0)
);
/

