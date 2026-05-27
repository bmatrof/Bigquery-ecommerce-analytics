-- FUNNEL ANALYSIS
-- User conversion across the main ecommerce journey

WITH funnel_steps AS (
  SELECT
    event_name,
    COUNT(DISTINCT user_pseudo_id) AS users
  FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
  WHERE event_name IN (
    'view_item',
    'add_to_cart',
    'begin_checkout',
    'purchase'
  )
  GROUP BY event_name
),

ordered_funnel AS (
  SELECT
    CASE event_name
      WHEN 'view_item' THEN 1
      WHEN 'add_to_cart' THEN 2
      WHEN 'begin_checkout' THEN 3
      WHEN 'purchase' THEN 4
    END AS step_number,
    event_name AS funnel_step,
    users
  FROM funnel_steps
)

SELECT
  step_number,
  funnel_step,
  users,
  ROUND(users * 100.0 / MAX(users) OVER (), 2) AS conversion_from_first_step
FROM ordered_funnel
ORDER BY step_number;
