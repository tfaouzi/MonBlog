<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Document sans nom</title>
</head>

<body>
<div id="global">

<header>
                <a href="index.php"><h1 id="titreBlog">Mon Blog</h1></a>
                <p>Je vous souhaite la bienvenue sur ce modeste blog.</p>
                
</header>

<?php

                
try
{
$bdd = new PDO('mysql:host=localhost:3308;dbname=monblog;charset=utf8', 'root', '');
}
catch (Exception $e)
{
        die('Erreur : ' . $e->getMessage());
}
			
		
                $billets = $bdd->query('select BIL_ID as id, BIL_DATE as date,'
                        . ' BIL_TITRE as titre, BIL_CONTENU as contenu from T_BILLET'
                        . ' order by BIL_ID desc limit 0,3');
									
                while  ($billet = $billets->fetch())
				    {
                    ?>
                    <article>
                        <header>
                            <h1 class="titreBillet"><?php echo $billet['titre'] ?></h1>
                            <time><?php  echo $billet['date'] ?></time>
                        </header>
                        <p><?= $billet['contenu'] ?></p>
  					<a href="commentaires.php?billet=<?php echo $billet['id']; ?>">Commentaires</a>
                    </article>
                    
                    <hr />
                   <?php
					}
					$billets->closeCursor();
                  ?>
                
            </div> <!-- #contenu -->
            <footer id="piedBlog">
                Blog réalisé avec PHP 7.3.1, HTML5 et CSS3.
            </footer>
 </div> <!-- #global -->
</body>
</html>
