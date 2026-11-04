-- Présentation des évolutions mensuelles sous forme de tableau croisé.
-- Les années sont en colonnes et les mois en lignes.
-- Objectif : faciliter la comparaison des taux d'évolution mensuels entre 2020 et 2024.

with moyennes_mensuelles as (
    select
        "annee",
        "mois",
        nom_mois,
        avg(conso_mw) as conso_mw_moyenne
    from eco2mix_analyse
    group by "annee", "mois", nom_mois
),
comparatif_mensuel as (
    select
        "annee",
        "mois",
        nom_mois,
        conso_mw_moyenne,
        lag(conso_mw_moyenne) over (
            partition by "mois"
            order by "annee") as conso_mw_annee_precedente
    from moyennes_mensuelles
),
evolutions as (
    select
        "annee",
        "mois",
        nom_mois,
        round(((conso_mw_moyenne - conso_mw_annee_precedente) / nullif(conso_mw_annee_precedente, 0)) * 100, 2) as pct_evolution_mensuel
    from comparatif_mensuel
)
select
    nom_mois,
    max(case when "annee" = 2020 then pct_evolution_mensuel end) as "2020",
    max(case when "annee" = 2021 then pct_evolution_mensuel end) as "2021",
    max(case when "annee" = 2022 then pct_evolution_mensuel end) as "2022",
    max(case when "annee" = 2023 then pct_evolution_mensuel end) as "2023",
    max(case when "annee" = 2024 then pct_evolution_mensuel end) as "2024"
from evolutions
group by "mois", nom_mois
order by "mois" ;