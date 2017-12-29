view: cda_001_email_sent_with_attachment {
  derived_table: {
    sql: SELECT
        udf.OBJ_ID  AS "udf.obj_id",
        CONVERT(VARCHAR(10),udf.DATE_BEG_SOURCE ,120) AS "udf.date_beg_source_date",
        case when cda_results.obj_id is not null then 'attachment' else 'no attachment' end  AS "attachment"
      FROM udf.UDF  AS udf
      LEFT JOIN (select obj_id from cda.CDA_RESULTS where cda_id = 1)  cda_results ON udf.obj_ID = cda_results.obj_ID
      ORDER BY 1
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: udf_obj_id {
    type: string
    sql: ${TABLE}."udf.obj_id" ;;
  }

  dimension: udf_date_beg_source_date {
    type: string
    sql: ${TABLE}."udf.date_beg_source_date" ;;
  }

  dimension: attachment {
    type: string
    sql: ${TABLE}.attachment ;;
  }

  set: detail {
    fields: [udf_obj_id, udf_date_beg_source_date, attachment]
  }
}
