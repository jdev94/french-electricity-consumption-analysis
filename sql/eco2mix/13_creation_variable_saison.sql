-- Création de la colonne saison dans la table d'analyse.
-- Les saisons retenues sont les saisons météorologiques.

alter table eco2mix_analyse
add column saison varchar(10);

-- Attribution d'une saison à chaque observation selon son mois.

update eco2mix_analyse
set saison= case
		when extract(month from "date") in (12,1,2) then 'Hiver'
		when extract(month from "date") in (3,4,5) then 'Printemps'
		when extract(month from "date") in (6,7,8) then 'Été'
		when extract(month from "date") in (9,10,11) then 'Automne'
	end;

-- Contrôle : vérifier qu'aucune observation ne possède une saison NULL.

select count(*)
from eco2mix_analyse
where "saison" is null