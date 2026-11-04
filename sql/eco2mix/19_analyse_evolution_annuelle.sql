-- Calcul de la puissance moyenne de consommation électrique pour chaque année.
-- Objectif : observer les évolutions de la consommation électrique entre 2019 et 2024.

select "annee", round(avg("conso_mw"),0) as conso_mw_moyenne
from eco2mix_analyse
group by "annee"
order by "annee";