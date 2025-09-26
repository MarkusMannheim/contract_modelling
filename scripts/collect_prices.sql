-- Select data for price spread analysis
SELECT
    DATEADD(MINUTE, -5, dp.settlementdate) AS Interval,
    REPLACE(dp.regionid, '1', '') AS Region,
    dp.rrp AS Price
FROM
    DISPATCHPRICE dp
WHERE
    dp.settlementdate BETWEEN DATEADD(MINUTE, 5, CONVERT(DATETIME, :start_date))
    AND DATEADD(DAY, 1, CONVERT(DATETIME, :end_date))
    AND dp.regionid != 'TAS1'  -- Exclude Tasmania
	AND dp.intervention = 0  -- Ensure no interventions in price data
ORDER BY
    Interval, Region;