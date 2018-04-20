view: booking {
  sql_table_name: PUBLIC.BOOKING ;;

  dimension: externalid {
    type: string
    sql: ${TABLE}.DATA:"ExternalId" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
