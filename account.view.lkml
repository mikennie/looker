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
    link: {
      label: "Account Analytics Dashboard"
      url: "/dashboards/3?Account%20Name={{ value | encode_uri }}"
      icon_url: "http://www.looker.com/favicon.ico"}
  }


#   measure: count {
#     type: count
#     drill_fields: []
#   }
}
