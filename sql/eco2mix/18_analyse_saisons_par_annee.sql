-- Calcul de la puissance moyenne de consommation électrique par année et par saison.
-- Objectif : comparer les saisons et observer l'évolution de leur consommation entre 2019 et 2024.

select "annee", "saison", round(avg("conso_mw"),0) as conso_mw_moyenne
from eco2mix_analyse 
group by "annee", "saison"
order by "annee", "saison";