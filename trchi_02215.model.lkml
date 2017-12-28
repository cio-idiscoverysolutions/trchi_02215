connection: "trchi-02215"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: trchi_02215_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: trchi_02215_default_datagroup

explore: ancillary_001_chronic_claims {}

explore: primary_audit {}

explore: relationship {}

explore: script {
  join: users {
    type: left_outer
    sql_on: ${script.user_id} = ${users.user_id} ;;
    relationship: many_to_one
  }
}

explore: users {}
