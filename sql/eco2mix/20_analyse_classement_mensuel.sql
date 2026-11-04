-- Classement des mois selon leur puissance moyenne de consommation électrique.
-- Calcul de la moyenne mensuelle pour chaque année entre 2019 et 2024.
-- Attribution d'un rang indépendant par année, du mois le plus consommateur au moins consommateur.
-- Objectif : vérifier la régularité du classement des mois au fil des années.

select
	"annee",
	"mois",
	round("conso_mw_moyenne",0) as conso_mw_moyenne,
	dense_rank() over (partition by annee order by conso_mw_moyenne desc) as rang
from (
	select "annee", "mois", avg(conso_mw) as conso_mw_moyenne
	from eco2mix_analyse 
	group  by "annee", "mois"
)as moyennes_mensuelles
order by "annee", "rang" ;