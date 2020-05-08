<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <title>Mon blog</title>
	<link href="style.css" rel="stylesheet" /> 
    </head>
        
    <body>

    <div id="bloc">
        <h1>Mon super blog !</h1>
        <p><a href="billets.php">Retour à la liste des billets</a></p>
 
<?php
// Connexion à la base de données
try
{
	$bdd = new PDO('mysql:host=localhost:3308;dbname=monblog;charset=utf8', 'root', '');
}
catch(Exception $e)
{
        die('Erreur : '.$e->getMessage());
}

// Récupération du billet
$id_billet= $_GET['billet'];

$req = $bdd->query('SELECT BIL_ID As id,BIL_TITRE AS titre,BIL_CONTENU AS contenu,DATE_FORMAT(BIL_DATE, \'%d/%m/%Y à %Hh%imin%ss\') AS date_creation_fr FROM t_billet WHERE BIL_ID LIKE '.$id_billet.'');
$donnees = $req->fetch();

?>

<div class="news">
    <h3>
        <?php echo htmlspecialchars($donnees['titre']); ?>
        <em>le <?php echo $donnees['date_creation_fr']; ?></em>
    </h3>
    
    <p>
    <?php
    echo nl2br(htmlspecialchars($donnees['contenu'])); // nl2br — Insère un retour à la ligne HTML à chaque nouvelle ligne
	// htmlspecialchars — Convertit les caractères spéciaux en entités HTML
    ?>
    </p>
</div>

<h1>Commentaires</h1>

<?php
$req->closeCursor(); // Important : on libère le curseur pour la prochaine requête


$req =$bdd->query('SELECT COM_AUTEUR AS auteur, COM_CONTENU AS commentaire, DATE_FORMAT(COM_DATE, \'%d/%m/%Y à %Hh%imin%ss\') AS date_commentaire_fr FROM t_commentaire WHERE BIL_ID LIKE '.$id_billet.' ORDER BY COM_DATE');

while ($donnees = $req->fetch())
{
?>
<p><strong><?php echo htmlspecialchars($donnees['auteur']); ?></strong> le <?php echo $donnees['date_commentaire_fr']; ?></p>
<p><?php echo nl2br(htmlspecialchars($donnees['commentaire'])); ?></p>
<?php
} // Fin de la boucle des commentaires
$req->closeCursor();
?>
    </div>
</body>
</html>
