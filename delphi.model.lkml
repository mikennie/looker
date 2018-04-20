connection: "snowflake"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: delphi_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: delphi_default_datagroup

explore: booking {}

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
