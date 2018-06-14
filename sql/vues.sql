
CREATE OR REPLACE VIEW "Incoherence_place_premiere" AS      -- cette vue renvoie les billets pris en premiere classe dans un train qui n'a que la seconde classe
SELECT b.Numero
FROM Billet b
WHERE b.Classe = '1' AND b.refTrajet.refLigne.refTypeTrain.nbPlacesPrem = 0;
/

CREATE OR REPLACE VIEW "Incoherence_prix_premiere" AS      -- cette vue renvoie les trajets qui indiquent un prix pour la première classe alors que le train n'a que la seconde classe
    SELECT traj.Numero
    FROM Trajet traj 
    WHERE traj.PrixPrem IS NOT NULL AND traj.refLigne.refTypeTrain.nbPlacesPrem = 0
;
/



CREATE OR REPLACE VIEW "Incoherence_date_billet" AS      -- cette vue renvoie les billets pris pour des jours où le train en question ne circule pas
    SELECT b.Numero
    FROM Billet b 
    WHERE b.refTrajet.Planning NOT IN (SELECT * FROM unnest("trouverPlanning"(b.Date)));
/


CREATE OR REPLACE VIEW "FrequentationLignes" AS         -- vue pour obtenir des statistiques sur la fréquentation de chaque ligne
    SELECT COUNT(b.Numero) AS Frequentation, 
    b.refTrajet.refLigne.GareDep.Nom AS NomDepart, 
    b.refTrajet.refLigne.GareDep.Adresse AS AdresseDepart,
    b.refTrajet.refLigne.GareDep.refVille.Nom AS VilleDepart, 
    b.refTrajet.refLigne.GareArr.Nom AS NomArrivee, 
    b.refTrajet.refLigne.GareArr.Adresse AS AdresseArrivee,
    b.refTrajet.refLigne.GareArr.refVille.Nom AS VilleArrivee
	FROM Billet b
    WHERE b.Annule = 0
    GROUP BY b.refTrajet.refLigne.GareDep.Nom, b.refTrajet.refLigne.GareDep.Adresse,
    b.refTrajet.refLigne.GareDep.refVille.Nom, b.refTrajet.refLigne.GareArr.Nom,
    b.refTrajet.refLigne.GareArr.Adresse,
    b.refTrajet.refLigne.GareArr.refVille.Nom
    ORDER BY Frequentation DESC;

CREATE OR REPLACE VIEW "FrequentationGares" AS         -- vue pour obtenir des statistiques sur la fréquentation de chaque ligne
    SELECT COUNT("Billet"."Id") AS Frequentation, "Gare"."Nom" AS Nom, "Gare"."Ville" AS Ville
	FROM "Billet" INNER JOIN "Trajet"
    ON "Billet"."Trajet" = "Trajet"."Id"
    INNER JOIN "Ligne"
    ON "Trajet"."Ligne" = "Ligne"."Id"
    INNER JOIN "Gare"
    ON ("Ligne"."NomGareDep" = "Gare"."Nom" AND "Ligne"."VilleGareDep" = "Gare"."Ville")
    OR ("Ligne"."NomGareArr" = "Gare"."Nom" AND "Ligne"."VilleGareArr" = "Gare"."Ville")
    WHERE "Billet"."Annule" = false
    GROUP BY Nom, Ville
    ORDER BY Frequentation DESC;
