view:  performance_data {
  # You can specify the table name if it's different from the view name:
#   sql_table_name: table(FUNCGETPERFORMANCEDATA(to_date({% parameter beginning_activity_date %}), to_date({% parameter ending_activity_date %}),to_date({% parameter beginning_consumption_date %}), to_date({% parameter ending_consumption_date %}), -8973450536730455136 ));;
  sql_table_name: table(FUNCGETPERFORMANCEDATA2(to_date({% parameter beginning_activity_date %}), to_date({% parameter ending_activity_date %}),to_date({% parameter beginning_consumption_date %}), to_date({% parameter ending_consumption_date %}) ));;

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

  dimension: booking_id {
    hidden: yes
    type: number
    sql: ${TABLE}.BOOKINGID;;
  }

#   dimension: Pickup_Roomnights_Total {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.PickupRoomnightsTotal;;
#   }
#
#   dimension: Blocked_Roomnights_Total {
#     hidden: yes
#     type: number
#     sql: ${TABLE}.BlockedRoomnightsTotal;;
#   }

  dimension: market_segment_id {
    hidden: yes
    type: number
    sql: ${TABLE}.MARKETSEGMENTID;;
  }

#   dimension: booking_id_ex {
#     type: number
#     sql: case when ${booking_id} is null then "XX" else ${booking_id} End;;
#   }

  dimension: location_id {
    type: number
    hidden: yes
    sql: ${TABLE}.LOCATIONID ;;
  }

  dimension: account_id {
    type: number
    hidden: yes
    sql: ${TABLE}.ACCOUNTID ;;
  }

  dimension: end_snapshot_date {
    type: date
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.ENDSNAPSHOTDATE ;;
  }

  dimension: begin_snapshot_date {
    type: date
    convert_tz: no
    hidden: yes
    sql: ${TABLE}.BEGINSNAPSHOTDATE ;;
  }

#   dimension: pattern_date {
#     type: date
#     sql: ${TABLE}.PATTERNDATE ;;
#   }

  dimension_group: pattern {
    type: time
    convert_tz: no
    timeframes: [date, week, month,year]
    sql: ${TABLE}.PATTERNDATE ;;
  }


  dimension: end_booking_status {
    type: number
    sql: ${TABLE}.ENDBOOKINGSTATUS ;;
  }

  dimension: begin_booking_status {
    type: number
    sql: ${TABLE}.BEGINBOOKINGSTATUS ;;
  }

  dimension: end_is_pickup_complete {
    type: string
    sql: ${TABLE}.ENDISPICKUPCOMPLETE ;;
  }

  dimension: begin_is_pickup_complete {
    type: string
    sql: ${TABLE}.BEGINISPICKUPCOMPLETE ;;
  }

  measure: blocked_new_definite_guestrooms {
    type: sum
    sql: ${TABLE}.BLOCKEDNEWDEFINITEGUESTROOMS ;;
  }

  measure: blocked_new_definite_guestroom_rev {
    type: sum
    value_format_name: usd
    sql: ${TABLE}.BLOCKEDNEWDEFINITEGUESTROOMREVENUE ;;
  }

  measure: blocked_net_definite_guestrooms {
    type: sum
    sql: ${TABLE}.BLOCKEDNETDEFINITEGUESTROOMS ;;
  }

  measure: blocked_net_definite_guestroom_rev {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDNETDEFINITEGUESTROOMREVENUE ;;
  }

  measure: blocked_reval_guestrooms {
    type: sum
    sql: ${TABLE}.BLOCKEDREVALUATIONGUESTROOMS ;;
  }

  measure: blocked_reval_guestroom_rev {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDREVALUATIONGUESTROOMREVENUE ;;
  }

  measure: blocked_slippage_guestrooms {
    type: sum
    sql: ${TABLE}.BLOCKEDSLIPPAGEGUESTROOMS ;;
  }

  measure: blocked_slippage_guestroom_rev {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDSLIPPAGEGUESTROOMREVENUE ;;
  }

  measure: blocked_lostdowngrade_guestrooms {
    type: sum
    sql: ${TABLE}.BLOCKEDLOSTDOWNGRADEDGUESTROOMS ;;
  }

  measure: blocked_lostdowngrade_guestroom_rev {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDLOSTDOWNGRADEDGUESTROOMREVENUE ;;
  }

  measure: blocked_definite_guestrooms_OTB {
    type: sum
    sql: ${TABLE}.BLOCKEDDEFINITEGUESTROOMONTHEBOOKS ;;
  }

  measure: blocked_definite_guestroom_rev_OTB {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDDEFINITEGUESTROOMREVENUEONTHEBOOKS ;;
  }

  measure: blocked_tentative_guestrooms_OTB {
    type: sum
    sql: ${TABLE}.BLOCKEDTENTATIVEGUESTROOMONTHEBOOKS ;;
  }

  measure: blocked_tentative_guestroom_rev_OTB {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDTENTATIVEGUESTROOMREVENUEONTHEBOOKS ;;
  }

  measure: blocked_prospect_guestrooms_OTB {
    type: sum
    sql: ${TABLE}.BLOCKEDPROSPECTGUESTROOMONTHEBOOKS ;;
  }

  measure: blocked_prospect_guestroom_rev_OTB {
    type: sum
    value_format: "$#.00;($#.00)"
    sql: ${TABLE}.BLOCKEDPROSPECTGUESTROOMREVENUEONTHEBOOKS ;;
  }

#   measure: count {
#     type: count
#     drill_fields: [detail*]
#   }

#   measure: new_definite_guestrooms {
#     type: number
#     sql: case when ${booking_id} is null then "XX" else ${booking_id} End;;
#   }

#   measure: new_definite_guestrooms {
#     type: sum
#       sql: CASE WHEN ${end_booking_status} = 3
#              AND COALESCE(${begin_booking_status}, 0) <> 3
#           THEN  CASE WHEN COALESCE(${end_is_pickup_complete}, 0) = 1
#                 THEN ${Pickup_Roomnights_Total}
#                 ELSE ${Blocked_Roomnights_Total}
#              END
#           ELSE 0
#        END ;;
#
# }

#   dimension: blockednetdefiniteguestrooms {
#     type: number
#     sql: ${TABLE}.BLOCKEDNETDEFINITEGUESTROOMS ;;
#   }
#
#   dimension: blockednetdefiniteguestroomrevenue {
#     type: number
#     sql: ${TABLE}.BLOCKEDNETDEFINITEGUESTROOMREVENUE ;;
#   }
#
#   dimension: blockedrevaluationguestrooms {
#     type: number
#     sql: ${TABLE}.BLOCKEDREVALUATIONGUESTROOMS ;;
#   }
#
#   dimension: blockedrevaluationguestroomrevenue {
#     type: number
#     sql: ${TABLE}.BLOCKEDREVALUATIONGUESTROOMREVENUE ;;
#   }
#
#   dimension: blockedslippageguestroom {
#     type: number
#     sql: ${TABLE}.BLOCKEDSLIPPAGEGUESTROOM ;;
#   }
#
#   dimension: blockedslippageguestroomrevenue {
#     type: number
#     sql: ${TABLE}.BLOCKEDSLIPPAGEGUESTROOMREVENUE ;;
#   }
#
#   dimension: blockedlostdowngradedguestrooms {
#     type: number
#     sql: ${TABLE}.BLOCKEDLOSTDOWNGRADEDGUESTROOMS ;;
#   }
#
#   dimension: blockedlostdowngradedguestroomrevenue {
#     type: number
#     sql: ${TABLE}.BLOCKEDLOSTDOWNGRADEDGUESTROOMREVENUE ;;
#   }
#
#   dimension: blockeddefiniteguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDDEFINITEGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: blockeddefiniteguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDDEFINITEGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: blockedtentativeguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDTENTATIVEGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: blockedtentativeguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDTENTATIVEGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: blockedprospectguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDPROSPECTGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: blockedprospectguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.BLOCKEDPROSPECTGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: forecastnewdefiniteguestrooms {
#     type: number
#     sql: ${TABLE}.FORECASTNEWDEFINITEGUESTROOMS ;;
#   }
#
#   dimension: forecastnewdefiniteguestroomrevenue {
#     type: number
#     sql: ${TABLE}.FORECASTNEWDEFINITEGUESTROOMREVENUE ;;
#   }
#
#   dimension: forecastnetdefiniteguestrooms {
#     type: number
#     sql: ${TABLE}.FORECASTNETDEFINITEGUESTROOMS ;;
#   }
#
#   dimension: forecastnetdefiniteguestroomrevenue {
#     type: number
#     sql: ${TABLE}.FORECASTNETDEFINITEGUESTROOMREVENUE ;;
#   }
#
#   dimension: forecastrevaluationguestrooms {
#     type: number
#     sql: ${TABLE}.FORECASTREVALUATIONGUESTROOMS ;;
#   }
#
#   dimension: forecastrevaluationguestroomrevenue {
#     type: number
#     sql: ${TABLE}.FORECASTREVALUATIONGUESTROOMREVENUE ;;
#   }
#
#   dimension: forecastslippageguestrooms {
#     type: number
#     sql: ${TABLE}.FORECASTSLIPPAGEGUESTROOMS ;;
#   }
#
#   dimension: forecastslippageguestroomrevenue {
#     type: number
#     sql: ${TABLE}.FORECASTSLIPPAGEGUESTROOMREVENUE ;;
#   }
#
#   dimension: forecastlostdowngradedguestrooms {
#     type: number
#     sql: ${TABLE}.FORECASTLOSTDOWNGRADEDGUESTROOMS ;;
#   }
#
#   dimension: forecastlostdowngradedguestroomrevenue {
#     type: number
#     sql: ${TABLE}.FORECASTLOSTDOWNGRADEDGUESTROOMREVENUE ;;
#   }
#
#   dimension: forecastdefiniteguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTDEFINITEGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: forecastdefiniteguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTDEFINITEGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: forecasttentativeguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTTENTATIVEGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: forecasttentativeguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTTENTATIVEGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: forecastprospectguestroomonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTPROSPECTGUESTROOMONTHEBOOKS ;;
#   }
#
#   dimension: forecastprospectguestroomrevenueonthebooks {
#     type: number
#     sql: ${TABLE}.FORECASTPROSPECTGUESTROOMREVENUEONTHEBOOKS ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks1 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS1 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks2 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS2 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks3 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS3 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks4 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS4 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks5 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS5 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks6 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS6 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks7 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS7 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks8 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS8 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks9 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS9 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks10 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS10 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks11 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS11 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks12 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS12 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks13 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS13 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks14 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS14 ;;
#   }
#
#   dimension: definiteeventrevenueonthebooks15 {
#     type: number
#     sql: ${TABLE}.DEFINITEEVENTREVENUEONTHEBOOKS15 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks1 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS1 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks2 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS2 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks3 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS3 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks4 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS4 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks5 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS5 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks6 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS6 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks7 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS7 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks8 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS8 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks9 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS9 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks10 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS10 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks11 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS11 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks12 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS12 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks13 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS13 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks14 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS14 ;;
#   }
#
#   dimension: prospecteventrevenueonthebooks15 {
#     type: number
#     sql: ${TABLE}.PROSPECTEVENTREVENUEONTHEBOOKS15 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks1 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS1 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks2 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS2 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks3 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS3 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks4 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS4 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks5 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS5 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks6 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS6 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks7 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS7 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks8 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS8 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks9 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS9 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks10 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS10 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks11 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS11 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks12 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS12 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks13 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS13 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks14 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS14 ;;
#   }
#
#   dimension: tentativeeventrevenueonthebooks15 {
#     type: number
#     sql: ${TABLE}.TENTATIVEEVENTREVENUEONTHEBOOKS15 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue1 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE1 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue2 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE2 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue3 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE3 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue4 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE4 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue5 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE5 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue6 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE6 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue7 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE7 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue8 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE8 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue9 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE9 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue10 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE10 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue11 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE11 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue12 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE12 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue13 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE13 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue14 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE14 ;;
#   }
#
#   dimension: lostdowngradedeventrevenue15 {
#     type: number
#     sql: ${TABLE}.LOSTDOWNGRADEDEVENTREVENUE15 ;;
#   }
#
#   dimension: netdefiniteeventrevenue1 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE1 ;;
#   }
#
#   dimension: netdefiniteeventrevenue2 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE2 ;;
#   }
#
#   dimension: netdefiniteeventrevenue3 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE3 ;;
#   }
#
#   dimension: netdefiniteeventrevenue4 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE4 ;;
#   }
#
#   dimension: netdefiniteeventrevenue5 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE5 ;;
#   }
#
#   dimension: netdefiniteeventrevenue6 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE6 ;;
#   }
#
#   dimension: netdefiniteeventrevenue7 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE7 ;;
#   }
#
#   dimension: netdefiniteeventrevenue8 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE8 ;;
#   }
#
#   dimension: netdefiniteeventrevenue9 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE9 ;;
#   }
#
#   dimension: netdefiniteeventrevenue10 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE10 ;;
#   }
#
#   dimension: netdefiniteeventrevenue11 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE11 ;;
#   }
#
#   dimension: netdefiniteeventrevenue12 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE12 ;;
#   }
#
#   dimension: netdefiniteeventrevenue13 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE13 ;;
#   }
#
#   dimension: netdefiniteeventrevenue14 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE14 ;;
#   }
#
#   dimension: netdefiniteeventrevenue15 {
#     type: number
#     sql: ${TABLE}.NETDEFINITEEVENTREVENUE15 ;;
#   }
#
#   dimension: newdefiniteeventrevenue1 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE1 ;;
#   }
#
#   dimension: newdefiniteeventrevenue2 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE2 ;;
#   }
#
#   dimension: newdefiniteeventrevenue3 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE3 ;;
#   }
#
#   dimension: newdefiniteeventrevenue4 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE4 ;;
#   }
#
#   dimension: newdefiniteeventrevenue5 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE5 ;;
#   }
#
#   dimension: newdefiniteeventrevenue6 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE6 ;;
#   }
#
#   dimension: newdefiniteeventrevenue7 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE7 ;;
#   }
#
#   dimension: newdefiniteeventrevenue8 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE8 ;;
#   }
#
#   dimension: newdefiniteeventrevenue9 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE9 ;;
#   }
#
#   dimension: newdefiniteeventrevenue10 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE10 ;;
#   }
#
#   dimension: newdefiniteeventrevenue11 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE11 ;;
#   }
#
#   dimension: newdefiniteeventrevenue12 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE12 ;;
#   }
#
#   dimension: newdefiniteeventrevenue13 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE13 ;;
#   }
#
#   dimension: newdefiniteeventrevenue14 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE14 ;;
#   }
#
#   dimension: newdefiniteeventrevenue15 {
#     type: number
#     sql: ${TABLE}.NEWDEFINITEEVENTREVENUE15 ;;
#   }
#
#   dimension: revaluationeventrevenue1 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE1 ;;
#   }
#
#   dimension: revaluationeventrevenue2 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE2 ;;
#   }
#
#   dimension: revaluationeventrevenue3 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE3 ;;
#   }
#
#   dimension: revaluationeventrevenue4 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE4 ;;
#   }
#
#   dimension: revaluationeventrevenue5 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE5 ;;
#   }
#
#   dimension: revaluationeventrevenue6 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE6 ;;
#   }
#
#   dimension: revaluationeventrevenue7 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE7 ;;
#   }
#
#   dimension: revaluationeventrevenue8 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE8 ;;
#   }
#
#   dimension: revaluationeventrevenue9 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE9 ;;
#   }
#
#   dimension: revaluationeventrevenue10 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE10 ;;
#   }
#
#   dimension: revaluationeventrevenue11 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE11 ;;
#   }
#
#   dimension: revaluationeventrevenue12 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE12 ;;
#   }
#
#   dimension: revaluationeventrevenue13 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE13 ;;
#   }
#
#   dimension: revaluationeventrevenue14 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE14 ;;
#   }
#
#   dimension: revaluationeventrevenue15 {
#     type: number
#     sql: ${TABLE}.REVALUATIONEVENTREVENUE15 ;;
#   }
#
  set: detail {
    fields: [
      booking_id,
      location_id,
      end_snapshot_date,
      begin_snapshot_date,
#       pattern_date
#       endbookingstatus,
#       beginbookingstatus,
#       endispickupcomplete,
#       beginispickupcomplete,
#       blockednewdefiniteguestrooms,
#       blockednewdefiniteguestroomrevenue,
#       blockednetdefiniteguestrooms,
#       blockednetdefiniteguestroomrevenue,
#       blockedrevaluationguestrooms,
#       blockedrevaluationguestroomrevenue,
#       blockedslippageguestroom,
#       blockedslippageguestroomrevenue,
#       blockedlostdowngradedguestrooms,
#       blockedlostdowngradedguestroomrevenue,
#       blockeddefiniteguestroomonthebooks,
#       blockeddefiniteguestroomrevenueonthebooks,
#       blockedtentativeguestroomonthebooks,
#       blockedtentativeguestroomrevenueonthebooks,
#       blockedprospectguestroomonthebooks,
#       blockedprospectguestroomrevenueonthebooks,
#       forecastnewdefiniteguestrooms,
#       forecastnewdefiniteguestroomrevenue,
#       forecastnetdefiniteguestrooms,
#       forecastnetdefiniteguestroomrevenue,
#       forecastrevaluationguestrooms,
#       forecastrevaluationguestroomrevenue,
#       forecastslippageguestrooms,
#       forecastslippageguestroomrevenue,
#       forecastlostdowngradedguestrooms,
#       forecastlostdowngradedguestroomrevenue,
#       forecastdefiniteguestroomonthebooks,
#       forecastdefiniteguestroomrevenueonthebooks,
#       forecasttentativeguestroomonthebooks,
#       forecasttentativeguestroomrevenueonthebooks,
#       forecastprospectguestroomonthebooks,
#       forecastprospectguestroomrevenueonthebooks,
#       definiteeventrevenueonthebooks1,
#       definiteeventrevenueonthebooks2,
#       definiteeventrevenueonthebooks3,
#       definiteeventrevenueonthebooks4,
#       definiteeventrevenueonthebooks5,
#       definiteeventrevenueonthebooks6,
#       definiteeventrevenueonthebooks7,
#       definiteeventrevenueonthebooks8,
#       definiteeventrevenueonthebooks9,
#       definiteeventrevenueonthebooks10,
#       definiteeventrevenueonthebooks11,
#       definiteeventrevenueonthebooks12,
#       definiteeventrevenueonthebooks13,
#       definiteeventrevenueonthebooks14,
#       definiteeventrevenueonthebooks15,
#       prospecteventrevenueonthebooks1,
#       prospecteventrevenueonthebooks2,
#       prospecteventrevenueonthebooks3,
#       prospecteventrevenueonthebooks4,
#       prospecteventrevenueonthebooks5,
#       prospecteventrevenueonthebooks6,
#       prospecteventrevenueonthebooks7,
#       prospecteventrevenueonthebooks8,
#       prospecteventrevenueonthebooks9,
#       prospecteventrevenueonthebooks10,
#       prospecteventrevenueonthebooks11,
#       prospecteventrevenueonthebooks12,
#       prospecteventrevenueonthebooks13,
#       prospecteventrevenueonthebooks14,
#       prospecteventrevenueonthebooks15,
#       tentativeeventrevenueonthebooks1,
#       tentativeeventrevenueonthebooks2,
#       tentativeeventrevenueonthebooks3,
#       tentativeeventrevenueonthebooks4,
#       tentativeeventrevenueonthebooks5,
#       tentativeeventrevenueonthebooks6,
#       tentativeeventrevenueonthebooks7,
#       tentativeeventrevenueonthebooks8,
#       tentativeeventrevenueonthebooks9,
#       tentativeeventrevenueonthebooks10,
#       tentativeeventrevenueonthebooks11,
#       tentativeeventrevenueonthebooks12,
#       tentativeeventrevenueonthebooks13,
#       tentativeeventrevenueonthebooks14,
#       tentativeeventrevenueonthebooks15,
#       lostdowngradedeventrevenue1,
#       lostdowngradedeventrevenue2,
#       lostdowngradedeventrevenue3,
#       lostdowngradedeventrevenue4,
#       lostdowngradedeventrevenue5,
#       lostdowngradedeventrevenue6,
#       lostdowngradedeventrevenue7,
#       lostdowngradedeventrevenue8,
#       lostdowngradedeventrevenue9,
#       lostdowngradedeventrevenue10,
#       lostdowngradedeventrevenue11,
#       lostdowngradedeventrevenue12,
#       lostdowngradedeventrevenue13,
#       lostdowngradedeventrevenue14,
#       lostdowngradedeventrevenue15,
#       netdefiniteeventrevenue1,
#       netdefiniteeventrevenue2,
#       netdefiniteeventrevenue3,
#       netdefiniteeventrevenue4,
#       netdefiniteeventrevenue5,
#       netdefiniteeventrevenue6,
#       netdefiniteeventrevenue7,
#       netdefiniteeventrevenue8,
#       netdefiniteeventrevenue9,
#       netdefiniteeventrevenue10,
#       netdefiniteeventrevenue11,
#       netdefiniteeventrevenue12,
#       netdefiniteeventrevenue13,
#       netdefiniteeventrevenue14,
#       netdefiniteeventrevenue15,
#       newdefiniteeventrevenue1,
#       newdefiniteeventrevenue2,
#       newdefiniteeventrevenue3,
#       newdefiniteeventrevenue4,
#       newdefiniteeventrevenue5,
#       newdefiniteeventrevenue6,
#       newdefiniteeventrevenue7,
#       newdefiniteeventrevenue8,
#       newdefiniteeventrevenue9,
#       newdefiniteeventrevenue10,
#       newdefiniteeventrevenue11,
#       newdefiniteeventrevenue12,
#       newdefiniteeventrevenue13,
#       newdefiniteeventrevenue14,
#       newdefiniteeventrevenue15,
#       revaluationeventrevenue1,
#       revaluationeventrevenue2,
#       revaluationeventrevenue3,
#       revaluationeventrevenue4,
#       revaluationeventrevenue5,
#       revaluationeventrevenue6,
#       revaluationeventrevenue7,
#       revaluationeventrevenue8,
#       revaluationeventrevenue9,
#       revaluationeventrevenue10,
#       revaluationeventrevenue11,
#       revaluationeventrevenue12,
#       revaluationeventrevenue13,
#       revaluationeventrevenue14,
#       revaluationeventrevenue15
    ]
  }
}
