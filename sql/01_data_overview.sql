-- DATASET OVERVIEW
-- Basic overview of users, events, and date range

SELECT
  MIN(PARSE_DATE('%Y%m%d', event_date)) AS start_date,
  MAX(PARSE_DATE('%Y%m%d', event_date)) AS end_date,
  COUNT(*) AS total_events,
  COUNT(DISTINCT user_pseudo_id) AS total_users
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`;



-- EVENT DISTRIBUTION
-- Most common ecommerce events

SELECT
  event_name,
  COUNT(*) AS event_count
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
GROUP BY event_name
ORDER BY event_count DESC;



-- PURCHASE SUMMARY
-- Total completed purchases

SELECT
  COUNT(*) AS total_purchases
FROM `bigquery-public-data.ga4_obfuscated_sample_ecommerce.events_*`
WHERE event_name = 'purchase';
