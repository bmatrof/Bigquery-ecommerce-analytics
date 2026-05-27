-- PRODUCT PERFORMANCE ANALYSIS
-- Most viewed and purchased products

WITH product_events AS (

  SELECT
    items.item_name AS product_name,
    event_name,
    user_pseudo_id

  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`,
  UNNEST(items) AS items

  WHERE
    _TABLE_SUFFIX BETWEEN '20201101' AND '20210131'
    AND event_name IN ('view_item', 'purchase')

)

SELECT
  product_name,

  COUNT(DISTINCT IF(
    event_name = 'view_item',
    user_pseudo_id,
    NULL
  )) AS view_users,

  COUNT(DISTINCT IF(
    event_name = 'purchase',
    user_pseudo_id,
    NULL
  )) AS purchase_users

FROM product_events

GROUP BY product_name

HAVING view_users > 100

ORDER BY purchase_users DESC
LIMIT 10;
