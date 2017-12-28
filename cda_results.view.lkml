view: cda_results {
  sql_table_name: cda.CDA_RESULTS ;;

  dimension: cda_results_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.CDA_RESULTS_ID ;;
  }

  dimension: cda_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.CDA_ID ;;
  }

  dimension: results_notes {
    type: string
    sql: ${TABLE}.RESULTS_NOTES ;;
  }

  dimension: results_value {
    type: string
    sql: ${TABLE}.RESULTS_VALUE ;;
  }

  dimension: udf_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.UDF_ID ;;
  }

  measure: count {
    type: count
    drill_fields: [cda_results_id, cda.cda_id, cda.name, udf.udf_id]
  }
}
