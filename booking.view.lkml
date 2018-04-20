view: booking {
  sql_table_name: PUBLIC.BOOKING ;;

  dimension: data {
    type: string
    sql: ${TABLE}.DATA ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
