INSERT INTO TypeTrain (Nom, nbPlacesPrem, nbPlacesSec, vitesseMax) VALUES
('Petit TER', 0, 452, 160);
/
INSERT INTO TypeTrain (Nom, nbPlacesPrem, nbPlacesSec, vitesseMax) VALUES 
('Grand TER', 60, 744, 160);
/
INSERT INTO TypeTrain (Nom, nbPlacesPrem, nbPlacesSec, vitesseMax) VALUES
('Intercites', 210, 1008, 200);
/
INSERT INTO TypeTrain (Nom, nbPlacesPrem, nbPlacesSec, vitesseMax) VALUES
('TGV Atlantique', 275, 600, 300);
/
INSERT INTO TypeTrain (Nom, nbPlacesPrem, nbPlacesSec, vitesseMax) VALUES
('TGV Duplex', 364, 656, 320);
/


INSERT INTO Ville (Nom, CP, ZoneHoraire) VALUES
('Paris', 75000, 2);
/
INSERT INTO Ville (Nom, CP, ZoneHoraire) VALUES
('Lyon', 69000, 2);
/
INSERT INTO Ville (Nom, CP, ZoneHoraire) VALUES
('Compiegne', 60200, 2);
/
INSERT INTO Ville (Nom, CP, ZoneHoraire) VALUES
('Bordeaux', 33000, 2);
/
INSERT INTO Ville (Nom, CP, ZoneHoraire) VALUES
('Maubeuge', 59600, 2);
/



INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Bordeaux Saint-Jean', typAdresse(1, 'rue Charles Domercq'), 'Bordeaux',NULL);
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Gare de Compiegne', typAdresse(1, 'place de la Gare'), 'Compiegne', 
listeHotels(Hotel('Hotel de Flandre', typAdresse(16, 'quai de la République'), 'Compiegne',  61)));
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Gare de Lyon', typAdresse(1, 'place Louis Armand'), 'Paris', NULL);
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Gare de Maubeuge', typAdresse(1, 'rue du Gazometre'), 'Maubeuge', NULL);
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Gare du Nord', typAdresse(18, 'rue de Dunkerque'), 'Paris', NULL);
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Gare Montparnasse', typAdresse(17, 'boulevard de Vaugirard'), 'Paris', NULL);
/
INSERT INTO Gare (Nom, Adresse, refVille, Hotels) VALUES
('Lyon Part-Dieu', typAdresse(5, 'place Charles Beraudier'), 'Lyon', NULL);
/





INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 1,REF(depart),REF(arrivee),'Grand TER'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Compiegne' AND arrivee.refVille = 'Compiegne';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 2,REF(arrivee),REF(depart),'Grand TER'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Compiegne' AND arrivee.refVille = 'Compiegne';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 3,REF(depart),REF(arrivee),'Intercites'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Maubeuge' AND arrivee.refVille = 'Maubeuge';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 4,REF(arrivee),REF(depart),'Intercites'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Maubeuge' AND arrivee.refVille = 'Maubeuge';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 5,REF(depart),REF(arrivee),'TGV Atlantique'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare Montparnasse' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Bordeaux Saint-Jean' AND arrivee.refVille = 'Bordeaux';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 6,REF(arrivee),REF(depart),'TGV Atlantique'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare Montparnasse' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Bordeaux Saint-Jean' AND arrivee.refVille = 'Bordeaux';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 7,REF(depart),REF(arrivee),'TGV Duplex'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare de Lyon' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Lyon Part-Dieu' AND arrivee.refVille = 'Lyon';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 8,REF(arrivee),REF(depart),'TGV Duplex'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare de Lyon' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Lyon Part-Dieu' AND arrivee.refVille = 'Lyon';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 9,REF(depart),REF(arrivee),'Intercites'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Compiegne' AND arrivee.refVille = 'Compiegne';
/
INSERT INTO Ligne (Numero, GareDep, GareArr, TypeTrain)
SELECT 10,REF(arrivee),REF(depart),'Intercites'
FROM Gare depart, Gare arrivee
WHERE depart.Nom = 'Gare du Nord' AND depart.refVille = 'Paris' 
AND arrivee.Nom = 'Gare de Compiegne' AND arrivee.refVille = 'Compiegne';
/



INSERT INTO Planning (Nom, Jours, Debut, Fin) VALUES
('Tous les jours', '1111111', NULL, NULL);
/
INSERT INTO Planning (Nom, Jours, Debut, Fin) VALUES
('Jours ouvres', '1111100', NULL, NULL);
/
INSERT INTO Planning (Nom, Jours, Debut, Fin) VALUES
('Week end', '0000011', NULL, NULL);




INSERT INTO Exceptions (Numero, Nom, refPlanning, Ajoute, DateDebut, DateFin)
SELECT 1,'Vacances printemps 2018', REF(alias), 1,
TO_DATE('2018-04-14','YYYY-MM-DD'), TO_DATE('2018-04-29','YYYY-MM-DD')
FROM Planning alias
WHERE alias.Nom = 'Week end';
/
INSERT INTO Exceptions (Numero, Nom, refPlanning, Ajoute, DateDebut, DateFin)
SELECT 2,'Vacances été 2018', REF(alias), 1,
TO_DATE('2018-06-30','YYYY-MM-DD'), TO_DATE('2018-09-01','YYYY-MM-DD')
FROM Planning alias
WHERE alias.Nom = 'Week end';
/
INSERT INTO Exceptions (Numero, Nom, refPlanning, Ajoute, DateDebut, DateFin)
SELECT 3,'Grève mai 2018', REF(alias), 0,
TO_DATE('018-05-01','YYYY-MM-DD'), TO_DATE('2018-05-08','YYYY-MM-DD')
FROM Planning alias
WHERE alias.Nom = 'Jours ouvres';





INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 1, REF(alias_ligne), TO_DATE('07:35:00','HH24:MI:SS'),
TO_DATE('08:26:00','HH24:MI:SS'), NULL, 015.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 2 AND alias_planning.Nom = 'Tous les jours';
/
INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 2, REF(alias_ligne), TO_DATE('07:34:00','HH24:MI:SS'),
TO_DATE('08:26:00','HH24:MI:SS'), NULL, 015.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 1 AND alias_planning.Nom = 'Tous les jours';
/
INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 3, REF(alias_ligne), TO_DATE('19:00:00','HH24:MI:SS'),
TO_DATE('19:41:00','HH24:MI:SS'), NULL, 013.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 10 AND alias_planning.Nom = 'Jours ouvres';
/
INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 4, REF(alias_ligne), TO_DATE('19:16:00','HH24:MI:SS'),
TO_DATE('19:58:00','HH24:MI:SS'), NULL, 013.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 9 AND alias_planning.Nom = 'Jours ouvres';
/
INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 5, REF(alias_ligne), TO_DATE('16:59:00','HH24:MI:SS'),
TO_DATE('18:56:00','HH24:MI:SS'), 086.00, 052.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 7 AND alias_planning.Nom = 'Week end';
/
INSERT INTO Trajet (Numero, refLigne, HeureDepart, HeureArrivee, PrixPrem, PrixSec, refPlanning)
SELECT 6, REF(alias_ligne), TO_DATE('17:04:00','HH24:MI:SS'),
TO_DATE('19:01:00','HH24:MI:SS'), 086.00, 075.00, REF(alias_planning)
FROM Ligne alias_ligne, Planning alias_planning
WHERE alias_ligne.Numero = 8 AND alias_planning.Nom = 'Jours ouvres';
/



INSERT INTO Voyageur (Numero, Nom, Prenom, NumeroTel, NumeroCarte, refVille, Adresse, TypeVoyageur) 
SELECT 1,'Zhao', 'Paul', '0605040302', '001234567890', REF(alias_ville), typAdresse(1, 'rue de la Joie'), 'Or'
FROM Ville alias_ville
WHERE alias_ville.Nom = 'Compiegne';
/
INSERT INTO Voyageur (Numero, Nom, Prenom, NumeroTel, NumeroCarte, refVille, Adresse, TypeVoyageur) 
SELECT 2,'Sabbagh', 'Guillaume', '0123456789', '314159265358', REF(alias_ville), typAdresse(12, 'place du Bonheur'), 'Argent'
FROM Ville alias_ville
WHERE alias_ville.Nom = 'Compiegne';
/
INSERT INTO Voyageur (Numero, Nom, Prenom, NumeroTel, NumeroCarte, refVille, Adresse, TypeVoyageur) 
SELECT 3,'Delabre', 'Martin', '0607080910', NULL, REF(alias_ville), typAdresse(7, 'avenue du Sourire'), 'Occasionnel'
FROM Ville alias_ville
WHERE alias_ville.Nom = 'Compiegne';
/
INSERT INTO Voyageur (Numero, Nom, Prenom, NumeroTel, NumeroCarte, refVille, Adresse, TypeVoyageur) 
SELECT 4,'Dubosc', 'Bertille', '0711235813', NULL, REF(alias_ville), typAdresse(88, 'boulevard du Chocolat'), 'Occasionnel'
FROM Ville alias_ville
WHERE alias_ville.Nom = 'Compiegne';
/



INSERT INTO Reservation (Numero,refVoyageur, Assurance, MoyenPaiement)
SELECT 1,REF(alias_voyageur), 0, 'carte_bleue'
FROM Voyageur alias_voyageur
WHERE alias_voyageur.Numero = 4;
/
INSERT INTO Reservation (Numero,refVoyageur, Assurance, MoyenPaiement)
SELECT 2,REF(alias_voyageur), 0, 'especes'
FROM Voyageur alias_voyageur
WHERE alias_voyageur.Numero = 3;
/
INSERT INTO Reservation (Numero,refVoyageur, Assurance, MoyenPaiement)
SELECT 3,REF(alias_voyageur), 1, 'cheque'
FROM Voyageur alias_voyageur
WHERE alias_voyageur.Numero = 1;
/
INSERT INTO Reservation (Numero,refVoyageur, Assurance, MoyenPaiement)
SELECT 4,REF(alias_voyageur), 1, 'carte_bleue'
FROM Voyageur alias_voyageur
WHERE alias_voyageur.Numero = 2;
/


INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 1, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 8, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 1;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 2, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 9, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 1;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 3, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 10, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 1;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 4, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 11, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 1;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 5, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 23, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 2;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 6, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 24, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 2;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 7, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 104, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 3;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 8, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 105, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 3;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 9, TO_DATE('2018-06-22','YYYY-MM-DD'), '2', 106, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 1 AND alias_reservation.Numero = 3;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 10, TO_DATE('2018-07-02','YYYY-MM-DD'), '1', 41, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 5 AND alias_reservation.Numero = 4;
/
INSERT INTO Billet (Numero, DateDepart, Classe, Place, Annule, refTrajet, refReservation)
SELECT 11, TO_DATE('2018-02-08','YYYY-MM-DD'), '2', 31, 0, REF(alias_trajet), REF(alias_reservation)
FROM Trajet alias_trajet, Reservation alias_reservation
WHERE alias_trajet.Numero = 6 AND alias_reservation.Numero = 4;
/
