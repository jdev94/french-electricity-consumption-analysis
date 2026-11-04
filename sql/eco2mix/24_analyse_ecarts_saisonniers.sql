with moyennes_saisonnieres as (
    select annee, saison, AVG(conso_mw) AS conso_mw_moyenne
    from eco2mix_analyse
    group by annee, saison
),
moyennes_par_saison as (
    select saison, AVG(conso_mw_moyenne) AS moyenne_saison_mw
    from moyennes_saisonnieres
    group by saison
),
moyenne_globale as (
    select AVG(conso_mw) as moyenne_globale_mw
    from eco2mix_analyse
)
select
    s.saison,
    ROUND(s.moyenne_saison_mw, 0) as moyenne_saison_mw,
    ROUND(g.moyenne_globale_mw, 0) as moyenne_globale_mw,
    ROUND((s.moyenne_saison_mw - g.moyenne_globale_mw) / g.moyenne_globale_mw * 100, 1) as ecart_pct
from moyennes_par_saison s
cross join moyenne_globale g
order by
    case s.saison
        when 'Hiver' then 1
        when 'Printemps' then 2
        when 'Été' then 3
        when 'Automne' then 4
    end;