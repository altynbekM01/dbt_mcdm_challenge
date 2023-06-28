WITH bing AS (
  SELECT 0 AS cost_per_engage
),
tiktok AS (
  SELECT 0 AS cost_per_engage
),
facebook AS (
  SELECT SUM(spend) / SUM(views) AS cost_per_engage
  FROM {{ ref('src_ads_creative_facebook_all_data')}}
),
twitter AS (
  SELECT SUM(spend) / SUM(engagements) AS cost_per_engage
  FROM {{ ref('src_promoted_tweets_twitter_all_data')}}
)
SELECT 'Bing' AS platform, cost_per_engage FROM bing
UNION ALL
SELECT 'TikTok' AS platform, cost_per_engage FROM tiktok
UNION ALL
SELECT 'Facebook' AS platform, cost_per_engage FROM facebook
UNION ALL
SELECT 'Twitter' AS platform, cost_per_engage FROM twitter 