connection: "snowflake"
label: "Sales and Catering"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: delphi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: delphi_default_datagroup

explore: performance_data {

  join: booking {
    view_label: "Booking"
    relationship: many_to_one
    sql_on: ${booking.booking_id} = ${performance_data.booking_id} ;;

  }

  always_filter: {

    filters: {
      field: performance_data.beginning_activity_date
      value: "2018-03-31"
    }

    filters: {
      field: performance_data.ending_activity_date
      value: "2018-03-01"
    }


    filters: {
      field: performance_data.beginning_consumption_date
      value: "2018-01-01"
    }

    filters: {
      field: performance_data.ending_consumption_date
      value: "2018-12-31"
    }

}
}
# explore: test {
#   always_filter: {
#     filters: {
#       field: test.beginning_consumption_date
#       value: "2017-03-01"
#     }
#     filters: {
#       field: test.ending_consumption_date
#       value: "2017-03-01"
#     }
#   }
# }

# - explore: account

# - explore: bookingdaysnapshot

# - explore: bookingtype

# - explore: delphi

# - explore: fdc

# - explore: housingmethod

# - explore: import

# - explore: industrycode

# - explore: leadsource

# - explore: location

# - explore: lostbusinessreason

# - explore: marketsegment

# - explore: newmarketuser

# - explore: qualityrating

# - explore: region

# - explore: salescatering

# - explore: setupvalue
