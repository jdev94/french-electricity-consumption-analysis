-- Nettoyage de la structure de la table eco2mix_analyse.
-- Objectif : conserver uniquement les colonnes utiles à l'analyse et simplifier leur nom pour faciliter les futures requêtes SQL.

-- 1. Suppression des colonnes Périmètre et Nature.
-- Les contrôles précédents ont confirmé que ces colonnes sont constantes sur la période 2019-2024 et n'apportent aucune variation à analyser.
alter table eco2mix_analyse
drop column "Périmètre",
drop column "Nature";

-- 2. Renommage des colonnes conservées.
-- Adoption de noms courts, explicites et sans espaces.
-- L'horodatage source est conservé malgré les anomalies temporelles identifiées lors de l'audit, pour permettre d'éventuels contrôles.

alter table eco2mix_analyse
rename column "Date" to date;

alter table eco2mix_analyse
rename column "Heure" to "heure";

alter table eco2mix_analyse
rename column "Date et Heure" to "horodatage_source";

alter table eco2mix_analyse
rename column "Consommation (MW)" to "conso_mw";