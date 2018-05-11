view: test {
  # You can specify the table name if it's different from the view name:
  sql_table_name: table(FUNCGETPERFORMANCEDATA(to_date({% parameter beginning_activity_date %}), to_date({% parameter ending_activity_date %}),to_date({% parameter beginning_consumption_date %}), to_date({% parameter ending_consumption_date %}), -8973450536730455136 ));;
  measure: count {
    type: count
#     drill_fields: [detail*]
  }

  measure: BlockedNewDefiniteGuestroomRevenue {
    type: sum
    sql: ${TABLE}.BLOCKEDNEWDEFINITEGUESTROOMREVENUE ;;
  }

  parameter: beginning_activity_date {
    #first date in table function
    type: date
  }

  parameter: ending_activity_date {
    #second date in table function
    type: date
  }

  parameter: beginning_consumption_date {
    #third date in table function
    type: date
  }

  parameter: ending_consumption_date {
    #fourth date in table function
    type: date
  }

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.ID ;;
  }

  dimension: bookingid {
    type: number
    sql: ${TABLE}.BOOKINGID ;;
  }

  dimension: locationid {
    type: number
    sql: ${TABLE}.LOCATIONID ;;
  }

}
