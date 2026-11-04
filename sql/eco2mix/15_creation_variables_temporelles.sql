-- Création des variables temporelles pour les analyses et visualisations.

alter table eco2mix_analyse 
add column annee int,
add column mois int,
add column jour_semaine_numero int,
add column jour_du_mois int,
add column semaine_weekend varchar(10),
add column nom_mois varchar(10);


-- Attribution des valeurs à partir de la date.
-- Les jours de semaine sont numérotés de 1 (lundi) à 7 (dimanche).
-- Le week-end correspond au samedi et au dimanche.

UPDATE eco2mix_analyse
set
	annee = extract(year from "date"),
	mois = extract(month from "date"),
	jour_semaine_numero = extract(isodow from "date"),
	jour_du_mois = extract(day from "date"),
	semaine_weekend = 
		case
		when extract(isodow from "date") between 1 and 5 then 'Semaine'
		when extract(isodow from "date") between 6 and 7 then 'Week end'
		end,
	nom_mois = to_char("date", 'TMMonth');


-- Contrôle des valeurs manquantes dans les six variables temporelles.
-- Résultat attendu : 0 pour chaque colonne.

select 
	count(*) filter (where "annee" is null) as annee_null,
	count(*) filter (where "mois" is null) as mois_null,
	count(*) filter (where "jour_semaine_numero" is null) as jour_semaine_numero_null,
	count(*) filter (where "jour_du_mois" is null) as jour_du_mois_null,
	count(*) filter (where "semaine_weekend" is null) as semaine_weekend_null,
	count(*) filter (where "nom_mois" is null) as nom_mois_null
from eco2mix_analyse;
