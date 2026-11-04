-- Contrôle de continuité temporelle :
-- détecte les écarts supérieurs au pas attendu de 30 minutes.
-- Utilisé pour identifier les timestamps manquants ou anomalies temporelles.

select "Date", "précédent" AT TIME ZONE 'UTC' AS "Timestamp précédent UTC", "Date - Heure" AS "Timestamp actuel UTC", "écart"
from (select "Date","Date - Heure",
	lag(cast("Date - Heure" as timestamptz))
	over (
		order by cast("Date - Heure" as timestamptz)
	) as "précédent",
	cast("Date - Heure" as timestamptz)
	- lag(cast("Date - Heure" as timestamptz))
	over (
		order by cast("Date - Heure" as timestamptz)
		) as "écart"
	from "consommation-quotidienne-brute.csv" cqbc
	) as t
where "écart" > '00:30:00' and to_date("Date", 'DD/MM/YYYY') between '2019-01-01' and '2024-12-31';
