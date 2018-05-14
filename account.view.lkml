view: account {
  sql_table_name: PUBLIC.ACCOUNT ;;

  dimension: account_id {
    primary_key: yes
    type: string
    sql: ${TABLE}.DATA:"AccountId" ;;
  }

  dimension: account_name {
    type: string
    sql: ${TABLE}.DATA:"Name" ;;
  }


#   measure: count {
#     type: count
#     drill_fields: []
#   }
}
