-- Select relevant data for price and demand analysis
SELECT
    DATEADD(MINUTE, -5, dcs.settlementdate) AS Interval,
    REPLACE(drs.regionid, '1', '') AS Region,  -- Format region name
    drs.totaldemand AS 'Total demand',
    dp.rrp AS Price
FROM
    DISPATCHCASESOLUTION dcs
INNER JOIN
    DISPATCHREGIONSUM drs  -- Join to supply data
    ON dcs.settlementdate = drs.settlementdate
    AND dcs.intervention = drs.intervention
INNER JOIN
    DISPATCHPRICE dp  -- Join to price data
    ON dcs.settlementdate = dp.settlementdate
    AND drs.regionid = dp.regionid
WHERE
    dcs.settlementdate BETWEEN DATEADD(MINUTE, 5, CONVERT(DATETIME, :start_date))
    AND DATEADD(DAY, 1, CONVERT(DATETIME, :end_date))  -- Filter by date range
	AND dp.intervention = 0  -- Ensure no interventions in price data
ORDER BY
    Interval, Region;