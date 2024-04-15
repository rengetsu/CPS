WITH gsm_counts AS (
    SELECT
        site_id,
        SUM(CASE WHEN frequency_band = '900' THEN 1 ELSE 0 END) AS G900_cells,
        SUM(CASE WHEN frequency_band = '1800' THEN 1 ELSE 0 END) AS G1800_cells
    FROM gsm
    GROUP BY site_id
),
umts_counts AS (
    SELECT
        site_id,
        SUM(CASE WHEN frequency_band = '900' THEN 1 ELSE 0 END) AS U900_cells,
        SUM(CASE WHEN frequency_band = '2100' THEN 1 ELSE 0 END) AS U2100_cells
    FROM umts
    GROUP BY site_id
),
lte_counts AS (
    SELECT
        site_id,
        SUM(CASE WHEN frequency_band = '700' THEN 1 ELSE 0 END) AS L700_cells,
        SUM(CASE WHEN frequency_band = '800' THEN 1 ELSE 0 END) AS L800_cells,
        SUM(CASE WHEN frequency_band = '1800' THEN 1 ELSE 0 END) AS L1800_cells,
        SUM(CASE WHEN frequency_band = '2100' THEN 1 ELSE 0 END) AS L2100_cells,
        SUM(CASE WHEN frequency_band = '2600' THEN 1 ELSE 0 END) AS L2600_cells
    FROM lte
    GROUP BY site_id
)
SELECT
    COALESCE(g.site_id, u.site_id, l.site_id) AS site_id,
    CONCAT('frequency_band_G900_by_site: ', COALESCE(g.G900_cells, 0)) AS frequency_band_G900_by_site,
    CONCAT('frequency_band_G1800_by_site: ', COALESCE(g.G1800_cells, 0)) AS frequency_band_G1800_by_site,
    CONCAT('frequency_band_U900_by_site: ', COALESCE(u.U900_cells, 0)) AS frequency_band_U900_by_site,
    CONCAT('frequency_band_U2100_by_site: ', COALESCE(u.U2100_cells, 0)) AS frequency_band_U2100_by_site,
    CONCAT('frequency_band_L700_by_site: ', COALESCE(l.L700_cells, 0)) AS frequency_band_L700_by_site,
    CONCAT('frequency_band_L800_by_site: ', COALESCE(l.L800_cells, 0)) AS frequency_band_L800_by_site,
    CONCAT('frequency_band_L1800_by_site: ', COALESCE(l.L1800_cells, 0)) AS frequency_band_L1800_by_site,
    CONCAT('frequency_band_L2100_by_site: ', COALESCE(l.L2100_cells, 0)) AS frequency_band_L2100_by_site,
    CONCAT('frequency_band_L2600_by_site: ', COALESCE(l.L2600_cells, 0)) AS frequency_band_L2600_by_site
FROM
    gsm_counts g
FULL JOIN umts_counts u ON g.site_id = u.site_id
FULL JOIN lte_counts l ON g.site_id = l.site_id OR u.site_id = l.site_id;