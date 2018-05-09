view: booking {
  sql_table_name: PUBLIC.BOOKING ;;

  dimension: booking_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.DATA:"BookingId" ;;
  }

  dimension: postas {
    type: string
    sql: ${TABLE}.DATA:"PostAs" ;;
  }
  measure: count {
    type: count
    drill_fields: []
  }
}
