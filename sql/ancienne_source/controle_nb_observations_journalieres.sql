-- Contrôle du nombre d'observations par journée
-- Une journée standard doit contenir 48 observations au pas de 30 minutes.
-- Identifie les journées dont le nombre d'observations diffère de 48.

select "Date", count(*) as nb_observations
from "consommation-quotidienne-brute.csv" cqbc
group by "Date"
having count(*) <> 48;