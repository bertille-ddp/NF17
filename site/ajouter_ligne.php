<html>
<head>
	<title>Ajouter une ligne</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link href="style.css" rel="stylesheet" media="all" type="text/css">
</head>

<body>
	<form action='ajout_ligne.php' method='post'>
		Ville de départ&nbsp: <select name='gare_dep'>
		<?php
			include "../model/db.php";
			include '../model/auth.php';


				$sql =  "SELECT nom,ville FROM gare ORDER BY nom;";

				$query = $db->query($sql);

				//$query->debugDumpParams();

    		foreach($query as $row) {
        echo "<option value='".$row["nom"].";".$row["ville"]."'>".$row["nom"]." de la ville de ".$row["ville"]."</option> <br>";
  			}

		?>
		</select><br><br>
		Ville d'arrivée&nbsp: <select name='gare_arr'>
		<?php
			include "../model/db.php";
			include '../model/auth.php';


				$sql =  "SELECT nom,ville FROM gare ORDER BY nom;";

				$query = $db->query($sql);

				//$query->debugDumpParams();

    		foreach($query as $row) {
        echo "<option value='".$row["nom"].";".$row["ville"]."'>".$row["nom"]." de la ville de ".$row["ville"]."</option> <br>";
  			}

		?>
		</select><br><br>
		Type de train&nbsp: <select name='type'>
		<?php
			include "../model/db.php";
			include '../model/auth.php';


				$sql =  "SELECT nom FROM typeTrain ORDER BY nom;";

				$query = $db->query($sql);

				//$query->debugDumpParams();

    		foreach($query as $row) {
        echo "<option value='".$row["nom"]."'>".$row["nom"]."</option> <br>";
  			}

		?>
		</select><br><br>
		<input type='submit' name='squalala'></input>

	</form>

</body>
</html>
