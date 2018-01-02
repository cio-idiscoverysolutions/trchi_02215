view: trchi_cda_level_001_base {
  derived_table: {
    sql: select  a.obj_id
        , a.date_beg_source as date_beg_source
        , c.description as author
        , d.description as custodian
        , e.numeric_value as num_attachments
        , max(case when b.obj_id is not null then 1 else 0 end) as attachment_ind
        , max(case when f.obj_id is not null then 1 else 0 end) as personal_domain_ind
        , max(case when g.obj_id is not null then 1 else 0 end) as external_domain_ind
        , max(case when h.obj_id is not null then 1 else 0 end) as outside_working_hours_ind
        , i.name as control_number
      from  udf.udf a
        left join (select obj_id from cda.cda_results where cda_id = 1) b on a.obj_id = b.obj_id
        left join spt.attribute c on a.obj_id = c.obj_id and c.name = 'Author'
        left join spt.attribute d on a.obj_id = d.obj_id and d.name = 'Custodian'
        left join spt.attribute e on a.obj_id = e.obj_id and e.name = 'Number of Attachments'
        left join (select obj_id from cda.cda_results where cda_id = 3) f on a.obj_id = f.obj_id
        left join (select obj_id from cda.cda_results where cda_id = 5) g on a.obj_id = g.obj_id
        left join (select obj_id from cda.cda_results where cda_id = 4) h on a.obj_id = h.obj_id
        left join dim.obj i on a.obj_id = i.obj_id
      group by  a.obj_id
        , a.date_beg_source
        , c.description
        , d.description
        , e.numeric_value
        , i.name
       ;;
  }

  dimension: obj_id {
    type: string
    sql: ${TABLE}.obj_id ;;
  }


  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: control_number {
    type: string
    sql: ${TABLE}.control_number ;;
  }

  dimension_group: date_beg_source {
    type: time
    timeframes: [
      raw,
      time,
      date,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}.date_beg_source ;;
  }

  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
  }

  dimension: custodian {
    type: string
    sql: ${TABLE}.custodian ;;
  }

  dimension: num_attachments {
    type: string
    sql: ${TABLE}.num_attachments ;;
  }

  dimension: attachment_ind {
    type: string
    sql: ${TABLE}.attachment_ind ;;
  }

  dimension: personal_domain_ind {
    type: string
    sql: ${TABLE}.personal_domain_ind ;;
  }

  dimension: external_domain_ind {
    type: string
    sql: ${TABLE}.external_domain_ind ;;
  }

  dimension: outside_working_hours_ind {
    type: string
    sql: ${TABLE}.outside_working_hours_ind ;;
  }

  set: detail {
    fields: [
      obj_id,
      date_beg_source_date,
      date_beg_source_month,
      date_beg_source_quarter,
      date_beg_source_raw,
      date_beg_source_time,
      date_beg_source_week,
      date_beg_source_year,
      author,
      custodian,
      num_attachments,
      attachment_ind,
      personal_domain_ind,
      external_domain_ind,
      outside_working_hours_ind,
      control_number
    ]
  }
}
