<html>
<head>
	<title>Ajouter une gare</title>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<link href="menu.css" rel="stylesheet" media="all" type="text/css">
</head>

<body>
	<form action='ajout_gare.php' method='post'>
		Nom de la gare : <input type='text' name='nom'></input> <br><br>
		Adresse : Numero <input type='number' min='0' name='numero_rue'></input> Rue <input type='text' name='rue'></input><br><br>
		Ville : <select name='ville'>
		<?php
			include "../model/db.php";
			include '../model/auth.php';
 
				
				$sql =  "SELECT nom FROM ville ORDER BY nom;";
		
				$query = $db->query($sql);

				//$query->debugDumpParams();

    		foreach($query as $row) {
        echo "<option value='".$row["nom"]."'>".$row["nom"]."</option> <br>";
  			}			
				echo "</input>";


		
		?>
		</select><br><br><br>
		<input type='submit' name='squalala'></input>

	</form>

</body>
</html>
