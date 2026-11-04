-- Comparaison de la puissance moyenne entre les jours de semaine et les week-ends sur la période 2019-2024.
-- Calcul de l'écart absolu en MW et de la baisse relative du week-end en %, avec la semaine comme référence.

select
    round(avg(conso_mw) filter (where semaine_weekend = 'Semaine'), 0) as conso_semaine_mw,
    round(avg(conso_mw) filter (where semaine_weekend = 'Week end'), 0) as conso_weekend_mw,
    round(
        avg(conso_mw) filter (where semaine_weekend = 'Semaine')
        - avg(conso_mw) filter (where semaine_weekend = 'Week end'),
        0
    ) as ecart_mw,
     ROUND(
        (AVG(conso_mw) FILTER (WHERE semaine_weekend = 'Semaine') - AVG(conso_mw) FILTER (WHERE semaine_weekend = 'Week end'))
        / NULLIF(AVG(conso_mw) FILTER (WHERE semaine_weekend = 'Semaine'), 0 ) * 100, 2) AS baisse_weekend_pct
from eco2mix_analyse;