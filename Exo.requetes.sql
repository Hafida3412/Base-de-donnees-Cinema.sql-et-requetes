/*exo1: Informations d'un film (id_film): titre, année, durée (au format 
HH/MM) et réalisateur*/
SELECT titre, annee_sortie_france, SEC_TO_TIME(duree_minutes*60), id_realisateur FROM film;


/*exo2: Liste des films dont la durée excède 2h15 classés par durée (du + long au + court)*/
SELECT titre, SEC_TO_TIME(duree_minutes*60) AS duree_minutes FROM film WHERE duree_minutes > 135
ORDER BY duree_minutes DESC;


/*exo3: Liste des films d'un réalisateur (en présicant l'année de sortie)*/
SELECT titre, annee_sortie_france FROM film
INNER JOIN realisateur 
ON film.id_realisateur = realisateur.id_realisateur 
INNER JOIN personne
ON personne.id_personne = realisateur.id_personne;


/*exo4: Nombre de films par genre classés dans l'ordre décroissant*/
SELECT
COUNT(*) id_genre, nom_genre FROM genre
INNER JOIN associer_genre
ON genre.id_genre = associer_genre.id_genre 
GROUP BY nom_genre
ORDER BY id_genre DESC;


/*exo5: Casting d'un film en particulier (id_film): nom, prénom des acteurs + sexe*/
SELECT personne.nom, personne.prenom, personne.sexe FROM personne
INNER JOIN acteur 
ON personne.id_personne = acteur.id_personne
INNER JOIN jouer 
ON acteur.id_acteur = jouer.id_acteur
WHERE jouer.id_film = 1