-- Contrôle de continuité temporelle :
-- détecte les écarts supérieurs au pas attendu de 15 minutes.
-- Utilisé pour identifier les timestamps manquants ou anomalies temporelles.

select "Date",
"précédent" AT TIME ZONE 'UTC' AS "Timestamp précédent UTC",
"Date et Heure" at TIME zone 'UTC' AS "Timestamp actuel UTC",
"écart"
from (select "Date","Date et Heure",
	lag("Date et Heure")
	over (
		order by "Date et Heure"
	) as "précédent",
	"Date et Heure"
	- lag("Date et Heure")
	over (
		order by "Date et Heure"
		) as "écart"
	from eco2mix_consommation
	where "Date" between '2019-01-01' and '2024-12-31'
	) as t
where "écart" > '00:15:00'