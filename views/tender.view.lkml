view: tender {
  sql_table_name: Square.TENDER ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
  }

  dimension: amount_money {
    label: "Tender Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
    value_format_name: decimal_2
  }

  dimension: card_details_card_brand {
    label: "Tender Card Brand"
    type: string
    sql: ${TABLE}.card_details_card_brand ;;
  }

  dimension: card_details_entry_method {
    label: "Tender Card Entry Method"
    type: string
    sql: ${TABLE}.card_details_entry_method ;;
  }

  dimension: card_details_fingerprint {
    label: "Tender Card Fingerprint"
    type: string
    sql: ${TABLE}.card_details_fingerprint ;;
  }

  dimension: card_details_last_4 {
    label: "Tender Card Last 4"
    type: number
    sql: ${TABLE}.card_details_last_4 ;;
  }

  dimension: card_details_status {
    label: "Tender Card Status"
    type: string
    sql: ${TABLE}.card_details_status ;;
  }

  dimension: cash_details_buyer_tendered_money {
    label: "Tender Cash Amount"
    type: number
    sql: ${TABLE}.cash_details_buyer_tendered_money ;;
  }

  dimension: cash_details_change_back_money {
    label: "Tender Cash Back"
    type: number
    sql: ${TABLE}.cash_details_change_back_money ;;
  }

  dimension_group: created {
    label: "Tender Created At"
    type: time
    timeframes: [
      raw,
      time_of_day,
      hour_of_day,
      day_of_week,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: number
    hidden: yes
    sql: ${TABLE}.customer_id ;;
  }

  dimension: location_id {
    label: "Tender Location ID"
    type: number
    sql: ${TABLE}.location_id ;;
  }

  dimension: note {
    label: "Tender Note"
    type: string
    sql: ${TABLE}.note ;;
  }

  dimension: order_id {
    type: number
    hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: processing_fee_money {
    label: "Square Processing Fee"
    description: "The amount of any Square processing fees applied to the tender. This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds."
    type: number
    sql: ${TABLE}.processing_fee_money ;;
    value_format_name: decimal_2
  }

  dimension: tip_money {
    label: "Tender Tip Amount"
    type: number
    sql: ${TABLE}.tip_money ;;
    value_format_name: decimal_2
  }

  dimension: transaction_id {
    type: number
    hidden: yes
    sql: ${TABLE}.transaction_id ;;
  }

  dimension: type {
    label: "Tender Type"
    type: string
    sql: ${TABLE}.type ;;
  }

  measure: revenue {
    type: sum
    sql: ${amount_money} ;;
    value_format_name: decimal_2
  }

  measure: total_tips {
    type: sum
    sql: ${tip_money} ;;
    value_format_name: decimal_2
  }

  measure: total_cash_back {
    type: sum
    sql: ${cash_details_change_back_money} ;;
    value_format_name: decimal_2
  }

  measure: total_processing_fee {
    type: sum
    sql: ${processing_fee_money} ;;
    value_format_name: decimal_2
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      transaction.id,
      customer.given_name,
      customer.company_name,
      customer.nickname,
      customer.id,
      customer.family_name,
      order.order_source_name,
      order.id,
      refund.count,
      tender_additional_recipient.count
    ]
  }
}
