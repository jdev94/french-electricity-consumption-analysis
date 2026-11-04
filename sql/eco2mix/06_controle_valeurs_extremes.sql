-- Contrôle des valeurs extrêmes de consommation :
-- identifie les observations correspondant aux consommations minimale et maximale.
-- Période analysée : 2019-2024.

with periode_2019_2024 as (
    select *
    from eco2mix_consommation emc 
    where "Date" between '2019-01-01' and '2024-12-31')
select *
from periode_2019_2024
where "Consommation (MW)" = (
    select min("Consommation (MW)")
    from periode_2019_2024
)
or "Consommation (MW)" = (
    select max("Consommation (MW)")
    from periode_2019_2024
);

-- Contrôle des valeurs nulles ou négatives de consommation :
-- identifie les observations dont la consommation est nulle ou négative.
-- Période analysée : 2019-2024.

select count(emc."Consommation (MW)")
from eco2mix_consommation emc 
where emc."Consommation (MW)" <= 0
and "Date" between '2019-01-01' and '2024-12-31';