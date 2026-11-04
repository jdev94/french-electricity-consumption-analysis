-- Vérification du passage à l'heure d'été 2024
-- Compare les timestamps UTC, les heures locales et les valeurs de consommation autour du changement d'heure.

select "Date - Heure", "Date", "Heure", "Consommation brute électricité (MW) - RTE"
from "consommation-quotidienne-brute.csv" cqbc
where cqbc."Date" = '31/03/2024' and cqbc."Heure" between '00:00' and '04:00';