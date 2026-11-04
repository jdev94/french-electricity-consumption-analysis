-- Comparaison de la puissance moyenne par heure entre la semaine et le week-end.
-- Calcul de l'écart en MW pour identifier les heures présentant les plus grandes différences.

select
    heure_numero,
    round(avg(conso_mw) filter (where semaine_weekend = 'Semaine'), 0) as conso_semaine_mw,
    round(avg(conso_mw) filter (where semaine_weekend = 'Week end'), 0) as conso_weekend_mw,
    round(
        avg(conso_mw) filter (where semaine_weekend = 'Semaine')
        - avg(conso_mw) filter (where semaine_weekend = 'Week end'),
        0
    ) as ecart_mw
from eco2mix_analyse
group by heure_numero
order by heure_numero;