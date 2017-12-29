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


explore: trchi_cda_level_001_base {
  from: trchi_cda_level_001_base
}

explore: udf {
  label: "Universal Data Format"
  join: ppl{
    type: left_outer
    sql_on: ${udf.ppl_id} = ${ppl.ppl_id} ;;
    relationship: one_to_many
    view_label: "People "
  }
  join: obj{
    type: left_outer
    sql_on: ${udf.obj_id} = ${obj.obj_id} ;;
    relationship: one_to_many
    view_label: "Object"
  }
  join: loc{
    type: left_outer
    sql_on: ${udf.loc_id} = ${loc.loc_id} ;;
    relationship: one_to_many
  }
  join: evt{
    type: left_outer
    sql_on: ${udf.evt_id} = ${evt.evt_id} ;;
    relationship: one_to_many
  }
  join: src{
    type: left_outer
    sql_on: ${udf.src_id} = ${src.src_id} ;;
    relationship: one_to_many
  }
  join: ppl_attribute{
    from: attribute
    type: left_outer
    sql_on: ${ppl.ppl_id} = ${ppl_attribute.ppl_id} ;;
    relationship: one_to_many
  }
  join: obj_attribute{
    from: attribute
    type: left_outer
    sql_on: ${obj.obj_id} = ${obj_attribute.obj_id} ;;
    relationship: one_to_many
  }
  join: loc_attribute{
    from: attribute
    type: left_outer
    sql_on: ${loc.loc_id} = ${loc_attribute.loc_id} ;;
    relationship: one_to_many
  }
  join: evt_attribute{
    from: attribute
    type: left_outer
    sql_on: ${evt_attribute.evt_id} = ${evt_attribute.evt_id} ;;
    relationship: one_to_many
  }
  join: cda_results{
    type: left_outer
    sql_on: ${udf.udf_id} = ${cda_results.udf_id} ;;
    relationship: one_to_many
  }
}
