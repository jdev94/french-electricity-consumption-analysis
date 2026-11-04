-- Contrôle des valeurs extrêmes de consommation :
-- identifie les observations correspondant aux consommations minimale et maximale.
-- Période analysée : 2019-2024.

with periode_2019_2024 as (
    select *
    from "consommation-quotidienne-brute.csv"
    where to_date("Date", 'DD/MM/YYYY')
          between '01/01/2019' and '31/12/2024'/
)
select *
from periode_2019_2024
where "Consommation brute électricité (MW) - RTE" = (
    select min("Consommation brute électricité (MW) - RTE")
    from periode_2019_2024
)
or "Consommation brute électricité (MW) - RTE" = (
    select max("Consommation brute électricité (MW) - RTE")
    from periode_2019_2024
);

