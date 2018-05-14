view:marketsegment {
  sql_table_name: PUBLIC.MARKETSEGMENT ;;

  dimension: market_segment_id {
    primary_key: yes
    type: string
    sql: ${TABLE}."MARKETSEGMENTID" ;;
  }

  dimension: market_segment_name {
    type: string
    sql: ${TABLE}."MARKETSEGMENTNAME" ;;
  }
  }
