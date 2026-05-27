-- REVENUE ANALYSIS
-- Revenue performance by traffic source

WITH purchase_revenue AS (

  SELECT
    traffic_source.source AS traffic_source,

    COUNT(DISTINCT ecommerce.transaction_id) AS total_transactions,

    ROUND(
      SUM(ecommerce.purchase_revenue),
      2
    ) AS total_revenue

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`

  WHERE
    _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
    AND event_name = 'purchase'

  GROUP BY traffic_source

)

SELECT
  traffic_source,
  total_transactions,
  total_revenue,

  ROUND(
    total_revenue / NULLIF(total_transactions, 0),
    2
  ) AS avg_order_value

FROM purchase_revenue

WHERE total_transactions > 10

ORDER BY total_revenue DESC;
