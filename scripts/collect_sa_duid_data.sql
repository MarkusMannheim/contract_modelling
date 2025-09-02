-- DUID output, availability, max capacity with aligned SA price
WITH
-- First create a CTE to split the DUID list
DUID_CTE AS (
    SELECT DISTINCT value AS DUID
    FROM STRING_SPLIT(REPLACE(REPLACE(:duid_list, '''', ''), ' ', ''), ',')
    WHERE LEN(value) > 0
),
-- Get the date range first
DATE_RANGE AS (
    SELECT DISTINCT SETTLEMENTDATE
    FROM DISPATCHLOAD
    WHERE SETTLEMENTDATE > CONVERT(DATETIME, :start_date)
      AND SETTLEMENTDATE <= DATEADD(DAY, 1, CONVERT(DATETIME, :end_date))
),
-- Pre-filter DUDETAIL to only relevant records
DUDETAIL_FILTERED AS (
    SELECT
        dd.DUID,
        dd.MAXCAPACITY,
        dd.EFFECTIVEDATE,
        dd.VERSIONNO,
        dr.SETTLEMENTDATE,
        ROW_NUMBER() OVER (
            PARTITION BY dd.DUID, dr.SETTLEMENTDATE
            ORDER BY dd.EFFECTIVEDATE DESC, dd.VERSIONNO DESC
        ) AS rn
    FROM
        DUDETAIL dd
    CROSS JOIN
        DATE_RANGE dr
    INNER JOIN
        DUID_CTE dc ON dd.DUID = dc.DUID
    WHERE
        dd.AUTHORISEDDATE IS NOT NULL
        AND dd.EFFECTIVEDATE <= DATEADD(DAY, 1, CONVERT(DATETIME, :end_date))
),
-- Get the latest capacity for each DUID/interval
LATEST_CAPACITY AS (
    SELECT
        DUID,
        SETTLEMENTDATE,
        MAXCAPACITY
    FROM DUDETAIL_FILTERED
    WHERE rn = 1
)
SELECT
    -- Time-adjusted 5-minute interval
    DATEADD(MINUTE, -5, dl.SETTLEMENTDATE) AS Interval,
    -- DUID identifier
    dl.DUID,
    -- Average output (MW)
    (dl.INITIALMW + dl.TOTALCLEARED) / 2.0 AS Output,
    -- Available capacity (MW)
    dl.AVAILABILITY AS Availability,
    -- Maximum capacity (MW)
    lc.MAXCAPACITY AS 'Maximum capacity',
    -- Relative output (% of max capacity)
    CASE WHEN lc.MAXCAPACITY > 0 THEN (dl.INITIALMW + dl.TOTALCLEARED) / 2.0 / lc.MAXCAPACITY ELSE NULL END AS 'Relative Output',
    -- Relative availability (% of max capacity)
    CASE WHEN lc.MAXCAPACITY > 0 THEN dl.AVAILABILITY / lc.MAXCAPACITY ELSE NULL END AS 'Relative availability'
FROM
    DISPATCHLOAD dl
INNER JOIN
    DISPATCHCASESOLUTION dcs
    ON dl.SETTLEMENTDATE = dcs.SETTLEMENTDATE
    AND dl.INTERVENTION = dcs.INTERVENTION
INNER JOIN
    DUID_CTE dc ON dl.DUID = dc.DUID
LEFT JOIN
    LATEST_CAPACITY lc
    ON dl.DUID = lc.DUID
    AND dl.SETTLEMENTDATE = lc.SETTLEMENTDATE
WHERE
    dl.SETTLEMENTDATE > CONVERT(DATETIME, :start_date)
    AND dl.SETTLEMENTDATE <= DATEADD(DAY, 1, CONVERT(DATETIME, :end_date))
ORDER BY
    Interval, DUID;
