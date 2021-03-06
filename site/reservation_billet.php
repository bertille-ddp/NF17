<html>
<head>
    <title>Confirmation de la réservation</title>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <link href="style.css" rel="stylesheet" media="all" type="text/css">
</head>

<body>
    <h1>Confirmation de la réservation</h1>
    <?php
    //récupération des informations
    $id_voyageur = $_POST['id_voy'];

    $infos_billet = explode('+', $_POST['trajet_choisi'], 3);
    $trajet = $infos_billet[0];
    $date = $infos_billet[1];
    $classe = $infos_billet[2];

    //il faut ajouter des guillemets simples pour correspondre au typer enum
    $paiement = "'";
    $paiement .= $_POST['paiement'];
    $paiement .= "'";

    $nb_billet = $_POST['nb_billet'];
    if (isset($_POST['assurance'])) {
        $assurance = 'true';
    } else {
        $assurance = 'false';
    }


    //connexion à la BDD
    require_once('../model/db.php');
    global $db;

    //il faut trouver les trajets correspondants
    $voyageur = $db->query("SELECT Prenom, Nom FROM Voyageur WHERE Id = $id_voyageur");
    $nom = $voyageur->fetch();

    if ($nom == null) {
        echo "<p>Aucun utilisateur dans notre base n'a ce numéro. <a href='chercher_compte.html' target='contenu'>Vérifiez votre numéro</a> ou <a href='creer_compte.html' target='contenu'>créez un compte</a>.</p>";
    } else {
        $tb_billets = $db->query("SELECT * FROM reserverBillet($nb_billet, $id_voyageur, $assurance, $paiement, $trajet, '$date', '$classe')");
        $liste_billets = $tb_billets->fetch();

        echo "<p>$nb_billet billet(s) a/ont bien été reservé(s) au nom de $nom[0] $nom[1]. Place(s)&nbsp: $liste_billets[0].</p>";
    }

    ?>
    <p><a href='accueil.html'>Retour</a></p>
</body>
</html>
