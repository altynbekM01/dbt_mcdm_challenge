WITH bing AS (
  SELECT SUM(spend) / SUM(clicks) AS CPC
  FROM {{ ref('src_ads_bing_all_data')}}
),
tiktok AS (
  SELECT SUM(spend) / SUM(clicks) AS CPC
  FROM {{ ref('src_ads_tiktok_ads_all_data')}}
),
facebook AS (
  SELECT SUM(spend) / SUM(clicks) AS CPC
  FROM {{ ref('src_ads_creative_facebook_all_data')}}
),
twitter AS (
  SELECT SUM(spend) / SUM(clicks) AS CPC
  FROM {{ ref('src_promoted_tweets_twitter_all_data')}}
)
SELECT 'Bing' AS platform, CPC FROM bing
UNION ALL
SELECT 'TikTok' AS platform, CPC FROM tiktok
UNION ALL
SELECT 'Facebook' AS platform, CPC FROM facebook
UNION ALL
SELECT 'Twitter' AS platform, CPC FROM twitter 