SELECT
    CONVERT(DATE, DATEADD(MINUTE, -5, dcs.settlementdate)) as Day,
    MAX(drs.totaldemand) AS 'Peak demand'
FROM
    DISPATCHCASESOLUTION dcs
INNER JOIN
    DISPATCHREGIONSUM drs
    ON dcs.settlementdate = drs.settlementdate
    AND dcs.intervention = drs.intervention
WHERE
    dcs.settlementdate BETWEEN DATEADD(MINUTE, 5, CONVERT(DATETIME, :start_date)) -- Start from 5 minutes into start date
    AND DATEADD(DAY, 1, CONVERT(DATETIME, :end_date)) -- End at midnight the date after end date
    AND drs.regionid = 'SA1' -- SA only
GROUP BY
    CONVERT(DATE, DATEADD(MINUTE, -5, dcs.settlementdate))
ORDER BY
    Day;