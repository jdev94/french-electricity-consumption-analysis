-- Contrôle du pas temporel de la consommation :
-- vérifie qu'aucune valeur de consommation n'est renseignée
-- en dehors des créneaux de 30 minutes (:00 et :30).
-- Période analysée : 2019-2024.

select *
from eco2mix_consommation emc
where (extract(minute from "Heure") <> 0 
	and extract(minute from "Heure") <> 30) and
	("Date" between '2019-01-01' and '2024-12-31') and
	emc."Consommation (MW)" is not null;