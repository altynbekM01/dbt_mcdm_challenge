WITH bing AS (
  SELECT SUM(spend) / SUM(conv) AS conversion_cost
  FROM {{ ref('src_ads_bing_all_data')}}
),
tiktok AS (
  SELECT SUM(spend) / SUM(conversions) AS conversion_cost
  FROM {{ ref('src_ads_tiktok_ads_all_data')}}
),
facebook AS (
  SELECT SUM(spend) / SUM(purchase) AS conversion_cost
  FROM {{ ref('src_ads_creative_facebook_all_data')}}
),
twitter AS (
  SELECT 0 conversion_cost
)
SELECT 'Bing' AS platform, conversion_cost FROM bing
UNION ALL
SELECT 'TikTok' AS platform, conversion_cost FROM tiktok
UNION ALL
SELECT 'Facebook' AS platform, conversion_cost FROM facebook
UNION ALL
SELECT 'Twitter' AS platform, conversion_cost FROM twitter 