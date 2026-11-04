-- Vérification du passage à l'heure d'hiver 2024
-- Compare les timestamps UTC avec les heures locales autour du changement d'heure.

select "Date - Heure", "Date", "Heure"
from "consommation-quotidienne-brute.csv" cqbc
where cqbc."Date" = '27/10/2024' and cqbc."Heure" between '00:00' and '04:00'