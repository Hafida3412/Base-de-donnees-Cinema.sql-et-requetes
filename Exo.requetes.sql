/*Informations d'un film (id_film): titre, année, durée (au format 
HH/MM) et résalisateur*/

SELECT titre, annee_sortie_france, SEC_TO_TIME(duree_minutes*60), id_realisateur FROM film