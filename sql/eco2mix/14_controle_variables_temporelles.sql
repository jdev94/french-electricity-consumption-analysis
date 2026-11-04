-- Contrôle des variables temporelles dérivées de la date.
-- Vérification des années, mois, jours et de la classification semaine/week-end.
-- Résultat attendu : 2 192 dates distinctes sur la période 2019-2024.

select count(*) as "Dates distinctes"
from(select distinct 
	extract(year from "date") as annee,
	extract(month from "date") as mois,
	extract(isodow from "date") as jour_semaine_numero,
	extract(day from "date") as jour_du_mois,
	(case
		when extract(isodow from "date") between 1 and 5 then 'Semaine'
		when extract(isodow from "date") between 6 and 7 then 'Week end'
	end) as semaine_weekend,
	to_char("date", 'TMMonth') as nom_mois
from eco2mix_analyse);