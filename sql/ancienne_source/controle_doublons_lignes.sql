-- Contrôle des doublons complets dans le jeu de données
-- Compare le nombre total de lignes au nombre de lignes entièrement distinctes.
-- Si les deux nombres sont identiques, aucun doublon complet n'est présent.

SELECT count(*) as nb_total, (
	select count(*)
	from (
		select distinct *
		from "consommation-quotidienne-brute.csv") as lignes_distinctes) as nb_distincts
from "consommation-quotidienne-brute.csv" cqbc 