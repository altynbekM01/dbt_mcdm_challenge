
WITH bing AS (
  SELECT SUM(imps)  AS impressions
  FROM {{ ref('src_ads_bing_all_data')}}
),
tiktok AS (
  SELECT SUM(impressions)  AS impressions
  FROM {{ ref('src_ads_tiktok_ads_all_data')}}
),
facebook AS (
  SELECT SUM(impressions)  AS impressions
  FROM {{ ref('src_ads_creative_facebook_all_data')}}
),
twitter AS (
  SELECT SUM(impressions)  AS impressions
  FROM {{ ref('src_promoted_tweets_twitter_all_data')}}
)
SELECT 'Bing' AS platform, impressions FROM bing
UNION ALL
SELECT 'TikTok' AS platform, impressions FROM tiktok
UNION ALL
SELECT 'Facebook' AS platform, impressions FROM facebook
UNION ALL
SELECT 'Twitter' AS platform, impressions FROM twitter 