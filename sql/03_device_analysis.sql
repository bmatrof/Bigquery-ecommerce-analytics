-- DEVICE PERFORMANCE ANALYSIS
-- Compares product views, purchases, and conversion rate by device type

WITH device_funnel AS (
  SELECT
    device.category AS device_type,

    COUNT(DISTINCT IF(event_name = 'view_item', user_pseudo_id, NULL)) AS view_item_users,
    COUNT(DISTINCT IF(event_name = 'purchase', user_pseudo_id, NULL)) AS purchase_users

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE
    _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
    AND event_name IN ('view_item', 'purchase')
  GROUP BY device_type
)

SELECT
  device_type,
  view_item_users,
  purchase_users,
  ROUND(purchase_users * 100.0 / NULLIF(view_item_users, 0), 2) AS conversion_rate
FROM device_funnel
ORDER BY conversion_rate DESC;
