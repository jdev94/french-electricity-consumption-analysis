-- Contrôle des timestamps dupliqués lors des changements d'heure
-- Période analysée : 2019-2024
-- Permet d'identifier les timestamps UTC présents plusieurs fois.

select  "Date et Heure", COUNT(*)
from eco2mix_consommation emc 
where "Date" between '2019-01-01' and '2024-12-31'
group by "Date et Heure"
having COUNT(*) > 1;