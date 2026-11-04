-- Création de la table de travail pour la période 2019-2024.
-- La table source reste inchangée.

create table eco2mix_analyse as
select *
from eco2mix_consommation
where "Date" between '2019-01-01' and '2024-12-31';