-- 1. Contrôle du nombre d'observations par journée
-- Une journée standard doit contenir 48 observations au pas de 30 minutes.
-- Identifie les journées dont le nombre d'observations diffère de 48.

select "Date", count(*) as nb_observations
from eco2mix_consommation emc
where "Date" between '2019-01-01' and '2024-12-31'
group by "Date"
having count(*) <> 96;

-- 2. Contrôle du nombre de mesures de consommation par jour
-- Attendu : 48 valeurs non NULL par jour

select "Date", count("Consommation (MW)") as nb_observations
from eco2mix_consommation emc
where "Date" between '2019-01-01' and '2024-12-31'
group by "Date"
having count("Consommation (MW)") <> 48;