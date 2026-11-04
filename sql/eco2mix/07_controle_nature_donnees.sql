
-- Contrôle de la nature des données :
-- vérifie le statut des données utilisées pour l'analyse.
-- Période analysée : 2019-2024.

select distinct emc."Nature" 
from eco2mix_consommation emc
where emc."Date" between '2019-01-01' and '2024-12-31';