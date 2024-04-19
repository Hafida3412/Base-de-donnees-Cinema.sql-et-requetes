/*exo.a: Informations d'un film (id_film): titre, année, durée (au format 
HH/MM) et réalisateur */
SELECT titre, annee_sortie_france, 
TIME_FORMAT(SEC_TO_TIME(duree_minutes*60),"%H:%i"), nom
FROM film
INNER JOIN realisateur 
ON film.id_realisateur = realisateur.id_realisateur 
INNER JOIN personne
ON personne.id_personne = realisateur.id_personne


/*exo.b: Liste des films dont la durée excède 2h15 classés par durée (du + long au + court) */
SELECT titre, SEC_TO_TIME(duree_minutes*60) AS duree_minutes 
FROM film WHERE duree_minutes > 135
ORDER BY duree_minutes DESC;


/*exo.c: Liste des films d'un réalisateur (en présicant l'année de sortie) */
SELECT titre, annee_sortie_france FROM film
INNER JOIN realisateur 
ON film.id_realisateur = realisateur.id_realisateur 
INNER JOIN personne
ON personne.id_personne = realisateur.id_personne
WHERE realisateur.id_realisateur = 1;


/*exo.d: Nombre de films par genre classés dans l'ordre décroissant */
SELECT
nom_genre, COUNT(*) AS Nb_films FROM genre
INNER JOIN associer_genre
ON genre.id_genre = associer_genre.id_genre 
GROUP BY nom_genre
ORDER BY Nb_films DESC;


/*exo.e: Nombre de films par réalisateur (classés dans l'ordre décroissant) */
SELECT nom AS realisateur,
COUNT(*) AS Nb_films FROM realisateur 
INNER JOIN film 
ON realisateur.id_realisateur = film.id_realisateur 
INNER JOIN personne 
ON realisateur.id_personne = personne.id_personne
GROUP BY realisateur ORDER BY Nb_films DESC;


/*exo.f: Casting d'un film en particulier (id_film): nom, prénom des acteurs + sexe */
SELECT CONCAT(nom, ' ', prenom), personne.sexe FROM personne
INNER JOIN acteur 
ON personne.id_personne = acteur.id_personne
INNER JOIN jouer 
ON acteur.id_acteur = jouer.id_acteur
WHERE jouer.id_film = 1


/*exo.g: Films tournés par un acteur en particulier (id_acteur)avec leur rôle et l'année de sortie
(du film le plus récent au plus ancien) */
SELECT titre, nom_role, annee_sortie_france FROM film 
INNER JOIN jouer ON film.id_film = jouer.id_film 
INNER JOIN role ON jouer.id_role = role.id_role 
WHERE jouer.id_acteur=3
ORDER BY annee_sortie_france DESC;


/*exo.h: Liste des acteurs qui sont à la fois acteurs et réalisateurs */
SELECT CONCAT(nom, ' ', prenom) FROM personne 
INNER JOIN acteur ON personne.id_personne = acteur.id_personne 
INNER JOIN realisateur ON personne.id_personne = realisateur.id_personne;


/*exo.i: Liste des films qui ont moins de 5 ans */
/*CURDATE() retourne la date actuelle */
SELECT titre, annee_sortie_france FROM film WHERE YEAR(CURDATE()) - annee_sortie_france < 5;


/*exo.j: Nombre d'hommes et de femmes parmi les acteurs */
SELECT sexe, COUNT(*) AS nombre FROM personne
INNER JOIN acteur
ON personne.id_personne = acteur.id_personne
GROUP BY sexe


/*exo.k: Liste des acteurs ayant plus de 50 ans (âge révolu et non révolu) */
SELECT CONCAT(prenom,' ',nom, ' '), date_naissance AS acteur 
FROM acteur 
INNER JOIN personne ON acteur.id_personne = personne.id_personne 
WHERE YEAR(NOW())-YEAR(date_naissance) > 50


/*exo.l: Acteurs ayant joué dans 3 films ou plus */
SELECT CONCAT(prenom, ' ', nom) AS acteur
FROM acteur 
INNER JOIN personne 
ON acteur.id_personne = personne.id_personne 
GROUP BY CONCAT(prenom, ' ', nom) 
HAVING COUNT(id_acteur) >= 1;