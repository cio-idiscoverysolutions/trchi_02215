view: trchi_cda_level_001_top_domains {
  derived_table: {
    sql: select  a.obj_id
        , a.name as control_number
        , b.ppl_id
        , b.type
        , e.unique_id
        , c.description as author
        , d.description as custodian
        , f.description as domain
        , case when g.description is not null then 1 else 0 end as external_domain_ind
        , case when h.description is not null then 1 else 0 end as personal_domain_ind
        , i.beg_date
      from dim.obj a
      left join
        (select  ppl_id
          , obj_id
          , 'cc' as type
        from  spt.attribute
        where name = 'cc'
          union all
        select  ppl_id
          , obj_id
          , 'to' as type
        from  spt.attribute
        where name = 'to'
          union all
        select  ppl_id
          , obj_id
          , 'bcc' as type
        from  spt.attribute
        where name = 'bcc') b on a.obj_id = b.obj_id
      left join spt.attribute c on a.obj_id = c.obj_id and c.name = 'Author'
      left join spt.attribute d on a.obj_id = d.obj_id and d.name = 'Custodian'
      left join dim.ppl e on b.ppl_id = e.ppl_id
      left join spt.attribute f on b.ppl_id = f.ppl_id and f.name = 'Domain'
      left join spt.attribute g on b.ppl_id = g.ppl_id and g.name = 'External Domain'
      left join spt.attribute h on b.ppl_id = h.ppl_id and h.name = 'Personal Domain'
      left join spt.attribute i on a.obj_id = i.obj_id and i.name = 'Parent Date'
      where (d.description = 'Turgeon_Jacques' and c.description = 'Jacques Turgeon, PhD')
        or  (d.description = 'Michaud_Veronique' and c.description = 'Veronique Michaud, PhD')
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: obj_id {
    type: string
    sql: ${TABLE}.obj_id ;;
  }

  dimension: control_number {
    type: string
    sql: ${TABLE}.control_number ;;
  }

  dimension: ppl_id {
    type: string
    sql: ${TABLE}.ppl_id ;;
  }

  dimension: type {
    type: string
    sql: ${TABLE}.type ;;
  }

  dimension: unique_id {
    type: string
    sql: ${TABLE}.unique_id ;;
  }

  dimension: author {
    type: string
    sql: ${TABLE}.author ;;
  }

  dimension: custodian {
    type: string
    sql: ${TABLE}.custodian ;;
  }

  dimension: domain {
    type: string
    sql: ${TABLE}.domain ;;
  }

  dimension: external_domain_ind {
    type: string
    sql: ${TABLE}.external_domain_ind ;;
  }

  dimension: personal_domain_ind {
    type: string
    sql: ${TABLE}.personal_domain_ind ;;
  }

  dimension: beg_date {
    type: date
    sql: ${TABLE}.beg_date ;;
  }

  set: detail {
    fields: [
      obj_id,
      control_number,
      ppl_id,
      type,
      unique_id,
      author,
      custodian,
      domain,
      external_domain_ind,
      personal_domain_ind,
      beg_date
    ]
  }
}
