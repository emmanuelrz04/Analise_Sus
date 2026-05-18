-- Para o gráfico de linhas
SELECT 
    ano,
    CASE 
        WHEN sigla_uf IN ('PI','PB','RN','MA','CE','PE','AL','SE','BA') THEN 'Nordeste'
        WHEN sigla_uf IN ('SP','RJ','MG','ES') THEN 'Sudeste'
    END AS regiao,
    ROUND(SUM(quantidade_equipes_atencao_basica_total) / SUM(populacao) * 10000, 2) AS equipes_por_10mil
FROM `basedosdados.br_ms_atencao_basica.municipio`
WHERE ano BETWEEN 2007 AND 2020
    AND mes = 12
    AND sigla_uf IN ('PI','PB','RN','MA','CE','PE','AL','SE','BA','SP','RJ','MG','ES')
GROUP BY ano, regiao
ORDER BY ano, regiao;