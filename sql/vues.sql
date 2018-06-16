
CREATE OR REPLACE VIEW Incoherence_place_premiere AS      -- cette vue renvoie les billets pris en premiere classe dans un train qui n'a que la seconde classe
SELECT b.Numero
FROM Billet b
WHERE b.Classe = '1' AND b.refTrajet.refLigne.refTypeTrain.nbPlacesPrem = 0;
/

CREATE OR REPLACE VIEW Incoherence_prix_premiere AS      -- cette vue renvoie les trajets qui indiquent un prix pour la première classe alors que le train n'a que la seconde classe
    SELECT traj.Numero
    FROM Trajet traj 
    WHERE traj.PrixPrem IS NOT NULL AND traj.refLigne.refTypeTrain.nbPlacesPrem = 0
;
/



CREATE OR REPLACE VIEW Incoherence_date_billet AS      -- cette vue renvoie les billets pris pour des jours où le train en question ne circule pas
    SELECT b.Numero
    FROM Billet b 
    WHERE b.refTrajet.Planning NOT IN (SELECT * FROM unnest("trouverPlanning"(b.Date)));
/



CREATE OR REPLACE VIEW FrequentationLignes AS         -- vue pour obtenir des statistiques sur la frÃ©quentation de chaque ligne
    SELECT  b.refTrajet.refLigne.numero AS NumeroLigne, COUNT(b.Numero) AS Frequentation
    FROM Billet b
    WHERE b.Annule = 0 
    GROUP BY b.refTrajet.refLigne.numero
    ORDER BY Frequentation DESC;
/


CREATE OR REPLACE VIEW FrequentationGares AS         -- vue pour obtenir des statistiques sur la fréquentation de chaque ligne
    SELECT Nom, Ville, SUM(Frequentation) AS Frequentat
    FROM
    (
      (
        SELECT COUNT(b.numero) AS Frequentation, b.refTrajet.refLigne.GareDep.Nom AS Nom, b.refTrajet.refLigne.GareDep.refVille AS Ville
        FROM Billet b
        WHERE b.annule = 0
        GROUP BY b.refTrajet.refLigne.GareDep.Nom, b.refTrajet.refLigne.GareDep.refVille
      )
      UNION
      (
        SELECT COUNT(b.numero) AS Frequentation, b.refTrajet.refLigne.GareArr.Nom AS Nom, b.refTrajet.refLigne.GareArr.refVille AS Ville
        FROM Billet b
        WHERE b.annule = 0
        GROUP BY b.refTrajet.refLigne.GareArr.Nom, b.refTrajet.refLigne.GareArr.refVille
      )
    )
    GROUP BY Nom, Ville
    ORDER BY Frequentat DESC;
    /