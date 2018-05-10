view:marketsegment {
  sql_table_name: PUBLIC.MARKETSEGMENT ;;

  dimension: marketsegment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.DATA:"MARKETSEGMENTID" ;;
  }

  dimension: market_segment_name {
    type: string
    sql: ${TABLE}.DATA:"MARKETSEGMENTNAME" ;;
  }
  }
