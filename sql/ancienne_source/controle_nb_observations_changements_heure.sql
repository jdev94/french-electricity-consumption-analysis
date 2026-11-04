-- Contrôle du nombre d'observations lors des changements d'heure (2019-2024)
-- Vérifie le nombre de lignes présentes pour chaque journée de passage à l'heure d'été et à l'heure d'hiver.

select  "Date", COUNT(*)
from "consommation-quotidienne-brute.csv"
where "Date" IN(
	'27/10/2019',
	'25/10/2020',
	'31/10/2021',
	'30/10/2022',
	'29/10/2023',
	'27/10/2024',
	'31/03/2019',
	'29/03/2020',
	'28/03/2021',
	'27/03/2022',
	'26/03/2023',
	'31/03/2024')
group by "Date";

