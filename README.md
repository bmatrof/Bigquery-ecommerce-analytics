# BigQuery Ecommerce Analytics

Customer journey, funnel, and revenue analysis using GA4 ecommerce data in BigQuery.

## Project Overview

In this project, I analyzed ecommerce user behavior using the Google Analytics 4 sample ecommerce dataset in BigQuery.

The main goal was to better understand:
- where users leave the funnel
- which traffic sources bring purchases
- how device type affects conversion
- which products get the most engagement
- what drives revenue growth

## Dataset

This project uses the Google Analytics 4 sample ecommerce dataset available in BigQuery.

Dataset documentation:
https://developers.google.com/analytics/bigquery/web-ecommerce-demo-dataset

BigQuery public dataset:

```sql
bigquery-public-data.ga4_obfuscated_sample_ecommerce
```

## Tools Used

- BigQuery
- SQL
- Python
- Looker Studio

## Business Questions

1. Where do most users drop off in the funnel?
2. Which traffic sources generate the most purchases?
3. Do mobile and desktop users behave differently?
4. Which products are viewed most often?
5. What factors contribute most to revenue?

## Project Structure

```text
sql/
visuals/
dashboard/
```

## Dashboard

The final dashboard will include:
- conversion funnel analysis
- traffic source performance
- device conversion analysis
- revenue overview
