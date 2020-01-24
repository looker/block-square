view: additional_recipient_receivable_refund {
  sql_table_name: Square.ADDITIONAL_RECIPIENT_RECEIVABLE_REFUND ;;
  drill_fields: [id]

  dimension: id {
    primary_key: yes
    type: number
    hidden: yes
    sql: ${TABLE}.id ;;
    description: "The receivable refund's unique ID, issued by Square payments servers."
  }

  dimension: amount_money {
    label: "Additional Receivable Refund Amount"
    type: number
    sql: ${TABLE}.amount_money ;;
    description: "The amount of the refund. This will always be non-negative."
  }

  dimension: receivable_id {
    type: number
    hidden: yes
    sql: ${TABLE}.receivable_id ;;
    description: "The ID of the receivable that the refund was applied to."
  }

  dimension: refund_id {
    type: number
    hidden: yes
    sql: ${TABLE}.refund_id ;;
    description: "The ID of the refund that is associated to this receivable refund."
  }

  dimension: transaction_location_id {
    label: "Additional Receivable Refund Location ID"
    type: number
    sql: ${TABLE}.transaction_location_id ;;
    description: "The ID of the location that created the receivable. This is the location ID on the associated transaction."
  }

  dimension_group: created {
    label: "Additional Receivable Refund Created At"
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
    datatype: date
    sql: ${TABLE}.created_at ;;
  }
}
