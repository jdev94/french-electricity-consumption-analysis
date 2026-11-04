-- Contrôle des heures présentes dans le jeu de données.
-- Résultat attendu : 24 valeurs distinctes, de 0 à 23.

select distinct extract(hour from "heure") as heure
from eco2mix_analyse
order by heure;


-- Création de la colonne contenant le numéro de l'heure.

alter table eco2mix_analyse
add column heure_numero int;


-- Attribution de l'heure à chaque observation.

update eco2mix_analyse
set heure_numero = extract(hour from "heure");


-- Contrôle des valeurs manquantes dans la colonne heure_numero.
-- Résultat attendu : 0.

select count(*)
from eco2mix_analyse
where "heure_numero" is null;