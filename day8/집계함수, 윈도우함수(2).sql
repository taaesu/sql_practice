SELECT
    YEAR(differentiation_date) as year,
    max(size_of_colony) over(partition by YEAR(differentiation_date)) - size_of_colony as year_dev,
    id
FROM ecoli_data
ORDER BY year, year_dev