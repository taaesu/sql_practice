WITH t AS(
    SELECT
        f.id,
        n.fish_name,
        f.length,
        max(length) over(partition by f.fish_type) as max_length
    FROM fish_info as f
    JOIN fish_name_info as n
    ON f.fish_type = n.fish_type)

SELECT
    id,
    fish_name,
    length
FROM t
WHERE length = max_length
ORDER BY id