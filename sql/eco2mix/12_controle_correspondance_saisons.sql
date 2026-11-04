-- Contrôle de la correspondance entre les mois et les saisons.
-- Objectif : vérifier la classification des 12 mois selon les saisons météorologiques
-- avant la création de la variable saison.
-- Résultat attendu : 12 correspondances distinctes, une par mois.

select distinct
	(case
		when extract(month from "date") in (12,1,2) then 'Hiver'
		when extract(month from "date") in (3,4,5) then 'Printemps'
		when extract(month from "date") in (6,7,8) then 'Été'
		when extract(month from "date") in (9,10,11) then 'Automne'
	end) as saison, extract(month from "date") as mois
from eco2mix_analyse
order by mois
