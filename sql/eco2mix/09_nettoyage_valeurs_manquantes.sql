-- Suppression des observations dont la consommation est NULL.
-- Ces lignes correspondent aux créneaux intermédiaires (:15 et :45), pour lesquels aucune valeur de consommation n'est renseignée.

delete from eco2mix_analyse ema
where ema."Consommation (MW)" is null;

-- Contrôle après nettoyage :
-- vérifie qu'aucune consommation NULL ne subsiste dans la table.
-- Résultat attendu : 0 ligne manquante.

select count(*) as nb_valeurs_manquantes
from eco2mix_analyse
where "Consommation (MW)" is null;