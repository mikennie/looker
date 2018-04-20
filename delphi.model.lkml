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

explore: performancedata {

  join: booking {
    view_label: "Booking"
    relationship: many_to_one
    sql_on: ${booking.bookingid} = ${performancedata.bookingid} ;;

  }
}

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
