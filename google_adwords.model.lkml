connection: "adwords_bigquery"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"


## Stats tables are used as left-most tables. See "README" for explanation of join logic.
explore: ad_stats {
  label: "Ad Stats"
  view_label: "Ad Stats"

## Entity tables are snapshots of the most recent day of data
  join: ad {
    view_label: "Ads"
    sql_on: ${ad.creative_id} = ${ad_stats.creative_id} ;;
    relationship:  many_to_one
  }
  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${ad.ad_group_id} = ${ad_group.ad_group_id} ;;
    relationship: many_to_one
  }
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} ;;
    relationship: many_to_one
  }
}

explore:ad_group_stats {
  label: "Ad Group Stats"
  view_label: "Ad Group Stats"

  join: ad_group {
    view_label: "Ad Groups"
    sql_on: ${ad_group_stats.ad_group_id} = ${ad_group.ad_group_id} ;;
    relationship: many_to_one
  }

  # Campaign table is filtered on data_date = latest_date
  join: campaign {
    view_label: "Campaigns"
    sql_on: ${ad_group.campaign_id} = ${campaign.campaign_id} ;;
    relationship: many_to_one
  }

}

explore: campaign_stats {
  label: "Campaign Stats"
  view_label: "Campaign Stats"

  join: campaign {
    view_label: "Campaign"
    sql_on: ${campaign_stats.campaign_id} = ${campaign.campaign_id} ;;
    relationship: many_to_one
  }
}


explore: keyword_stats {
  label: "Keyword Stats"
  view_label: "Keyword Stats"

  join: keyword {
    view_label: "Keyword"
    sql_on: ${keyword_stats.unique_key} = ${keyword.unique_key} ;;
    relationship: many_to_one
  }
}
