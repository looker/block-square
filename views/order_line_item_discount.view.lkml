view: order_line_item_discount {
  sql_table_name: Square.ORDER_LINE_ITEM_DISCOUNT ;;

  dimension: amount_money {
    type: number
    sql: ${TABLE}.amount_money ;;
  }

  dimension: applied_money {
    type: number
    sql: ${TABLE}.applied_money ;;
  }

  dimension: catalog_object_id {
    type: number
    sql: ${TABLE}.catalog_object_id ;;
  }

  dimension: name {
    type: string
    sql: ${TABLE}.name ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  dimension: percentage {
    type: number
    sql: ${TABLE}.percentage ;;
  }

  dimension: scope {
    type: string
    sql: ${TABLE}.scope ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: uid {
    type: number
    value_format_name: id
    sql: ${TABLE}.uid ;;
  }

  measure: count {
    type: count
    drill_fields: [name]
  }
}