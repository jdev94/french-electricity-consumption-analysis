-- Présentation du classement mensuel sous forme de tableau croisé.
-- Les années sont en colonnes et les rangs en lignes.
-- Objectif : faciliter la comparaison des mois entre 2019 et 2024.

with classement as (
    select
        annee,
        mois,
        nom_mois,
        dense_rank() over (partition by annee order by conso_mw_moyenne desc) as rang
    from (
        select
            annee,
            mois,
            nom_mois,
            avg(conso_mw) as conso_mw_moyenne
        from eco2mix_analyse
        group by annee, mois, nom_mois) as moyennes_mensuelles)
select
    rang,
    max(case when annee = 2019 then nom_mois end) as "2019",
    max(case when annee = 2020 then nom_mois end) as "2020",
    max(case when annee = 2021 then nom_mois end) as "2021",
    max(case when annee = 2022 then nom_mois end) as "2022",
    max(case when annee = 2023 then nom_mois end) as "2023",
    max(case when annee = 2024 then nom_mois end) as "2024"
from classement
group by rang
order by rang;