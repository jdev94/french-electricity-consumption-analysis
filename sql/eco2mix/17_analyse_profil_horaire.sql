-- Calcul de la puissance moyenne de consommation électrique pour chaque heure de la journée.
-- Objectif : identifier les heures où la consommation est la plus élevée sur la période 2019-2024.

select heure_numero, round(avg(conso_mw),0) as conso_mw_moyenne
from eco2mix_analyse
group by heure_numero
order by heure_numero;
