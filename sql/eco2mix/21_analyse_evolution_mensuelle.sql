-- Calcul de l'évolution annuelle de la puissance moyenne pour chaque mois entre 2019 et 2024.
-- Comparaison avec le même mois de l'année précédente à l'aide de lag().
-- Calcul du taux d'évolution en pourcentage, arrondi à deux décimales.
-- Les valeurs de 2019 sont null car les données de 2018 ne sont pas disponibles.

select 
	"annee",
	"mois",
	round((((conso_mw_moyenne - conso_mw_annee_precedente) / nullif(conso_mw_annee_precedente, 0)) * 100), 2) as pct_evolution_mensuel,
	round(conso_mw_moyenne, 0) as conso_mw_moyenne,
	round(conso_mw_annee_precedente, 0) as conso_mw_annee_precedente
from (
	select"annee", "mois", "conso_mw_moyenne", lag(conso_mw_moyenne) over (partition by mois order by annee) as conso_mw_annee_precedente
	from (
		select "annee", "mois", avg(conso_mw) as conso_mw_moyenne
		from eco2mix_analyse
		group by "annee", "mois")
		as moyennes_mensuelles)
		as comparatif_mensuel
order by "annee", "mois";