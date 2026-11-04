-- Contrôle des colonnes Périmètre et Nature.
-- Objectif : vérifier que ces colonnes ne présentent aucune variation
-- sur la période d'analyse 2019-2024, avant leur éventuelle suppression.

-- 1. Identification des valeurs distinctes de Périmètre.
select distinct ema."Périmètre" 
from eco2mix_analyse ema

-- 2. Identification des valeurs distinctes de Nature.
select distinct ema."Nature" 
from eco2mix_analyse ema

-- 3. Vérification des valeurs manquantes dans les deux colonnes.
select
	count(*) filter(where "Périmètre" is null) as null_perimetre,
	count(*) filter(where "Nature" is null) as null_nature
from eco2mix_analyse ema 