explore: campaign  {}
view: campaign {
  sql_table_name: (select * from `mobovidata.co_adwords.Campaign_5783050490` where _LATEST_DATE = _DATA_DATE) ;;
## must limit the table scope using latest_date = _data_date to ensure we're always using the latest recorded informaiton


  dimension_group: data {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: TIMESTAMP(${TABLE}._DATA_DATE) ;;
  }

  dimension_group: _latest {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}._LATEST_DATE ;;
  }

  dimension: advertising_channel_sub_type {
    type: string
    sql: ${TABLE}.AdvertisingChannelSubType ;;
  }

  dimension: advertising_channel_type {
    type: string
    sql: ${TABLE}.AdvertisingChannelType ;;
  }

  dimension: amount {
    type: number
    sql: ${TABLE}.Amount ;;
  }

  dimension: bid_type {
    type: string
    sql: ${TABLE}.BidType ;;
  }

  dimension: bidding_strategy_id {
    type: number
    sql: ${TABLE}.BiddingStrategyId ;;
  }

  dimension: bidding_strategy_name {
    type: string
    sql: ${TABLE}.BiddingStrategyName ;;
  }

  dimension: bidding_strategy_type {
    type: string
    sql: ${TABLE}.BiddingStrategyType ;;
  }

  dimension: budget_id {
    type: number
    sql: ${TABLE}.BudgetId ;;
  }

  dimension: campaign_desktop_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignDesktopBidModifier ;;
  }

  dimension: campaign_id {
    type: number
    primary_key: yes
    sql: ${TABLE}.CampaignId ;;
  }

  dimension: campaign_mobile_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignMobileBidModifier ;;
  }

  dimension: campaign_name {
    type: string
    sql: ${TABLE}.CampaignName ;;
    # html: Campaign Name ;;
  }

  dimension: campaign_status {
    type: string
    sql: ${TABLE}.CampaignStatus ;;
  }

  dimension: campaign_tablet_bid_modifier {
    type: number
    sql: ${TABLE}.CampaignTabletBidModifier ;;
  }

  dimension: campaign_trial_type {
    type: string
    sql: ${TABLE}.CampaignTrialType ;;
  }

  dimension_group: end {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: ${TABLE}.EndDate ;;
  }

  dimension: enhanced_cpc_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpcEnabled ;;
  }

  dimension: enhanced_cpv_enabled {
    type: yesno
    sql: ${TABLE}.EnhancedCpvEnabled ;;
  }

  dimension: external_customer_id {
    type: number
    sql: ${TABLE}.ExternalCustomerId ;;
  }

  dimension: is_budget_explicitly_shared {
    type: yesno
    sql: ${TABLE}.IsBudgetExplicitlyShared ;;
  }

  dimension: label_ids {
    type: string
    sql: ${TABLE}.LabelIds ;;
  }

  dimension: labels {
    type: string
    sql: ${TABLE}.Labels ;;
  }

  dimension: period {
    type: string
    sql: ${TABLE}.Period ;;
  }

  dimension: serving_status {
    type: string
    sql: ${TABLE}.ServingStatus ;;
  }

  dimension_group: start {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    sql: (TIMESTAMP(${TABLE}.StartDate)) ;;
  }

  dimension: tracking_url_template {
    type: string
    sql: ${TABLE}.TrackingUrlTemplate ;;
  }

  dimension: url_custom_parameters {
    type: string
    sql: ${TABLE}.UrlCustomParameters ;;
  }

  measure: count {
    type: count
    drill_fields: [campaign_name, bidding_strategy_name]
  }
}
