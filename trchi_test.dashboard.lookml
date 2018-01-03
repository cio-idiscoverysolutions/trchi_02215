- dashboard: trchi_employee_risk_assessment_level_001_cdas_dynamic_test
  title: 'TRCHI Employee Risk Assessment: Level 001 CDAs (Dynamic)_test'
  layout: newspaper
  elements:
  - name: Tabula Rasa HealthCare
    type: text
    title_text: Tabula Rasa HealthCare
    subtitle_text: Email analysis of selected custodians
    row: 0
    col: 0
    width: 19
    height: 2
  - name: Total Sent Emails
    title: Total Sent Emails
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: single_value
    fields:
    - trchi_cda_level_001_base.count
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 2
    col: 0
    width: 8
    height: 8
  - name: All Sent Emails
    title: All Sent Emails
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: looker_column
    fields:
    - trchi_cda_level_001_base.count
    - trchi_cda_level_001_base.date_beg_source_week
    fill_fields:
    - trchi_cda_level_001_base.date_beg_source_week
    sorts:
    - trchi_cda_level_001_base.date_beg_source_week
    limit: 500
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 2
    col: 8
    width: 11
    height: 8
  - name: Sent Emails with Attachments
    title: Sent Emails with Attachments
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: looker_column
    fields:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.count
    - trchi_cda_level_001_base.attachment_ind
    pivots:
    - trchi_cda_level_001_base.attachment_ind
    fill_fields:
    - trchi_cda_level_001_base.date_beg_source_week
    sorts:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.attachment_ind
    limit: 500
    dynamic_fields:
    - table_calculation: attachment_of_total
      label: Attachment % of Total
      expression: round(pivot_index(${trchi_cda_level_001_base.count}, 2) / ${total_emails_sent},
        2)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: total_emails_with_attachments
      label: Total Emails with Attachments
      expression: 'pivot_index(${trchi_cda_level_001_base.count}, 2) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: total_emails_sent
      label: Total Emails Sent
      expression: 'pivot_index(${trchi_cda_level_001_base.count}, 1) + pivot_index(${trchi_cda_level_001_base.count},
        2) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types:
      attachment_of_total: line
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: total_emails_with_attachments
        name: Total Emails with Attachments
        axisId: total_emails_with_attachments
    - label: ''
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "#%"
      series:
      - id: attachment_of_total
        name: Attachment % of Total
        axisId: attachment_of_total
    x_axis_label: Week
    hidden_fields:
    - trchi_cda_level_001_base.count
    - total_emails_sent
    x_axis_datetime_label: "%B %Y"
    hide_legend: true
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 10
    col: 8
    width: 11
    height: 8
  - name: Total Emails with Attachments
    title: Total Emails with Attachments
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: single_value
    fields:
    - trchi_cda_level_001_base.count
    filters:
      trchi_cda_level_001_base.attachment_ind: '1'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 10
    col: 0
    width: 8
    height: 8
  - name: Total External Domain Emails
    title: Total External Domain Emails
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: single_value
    fields:
    - trchi_cda_level_001_base.count
    filters:
      trchi_cda_level_001_base.external_domain_ind: '1'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 18
    col: 0
    width: 8
    height: 8
  - name: Total Personal Domain Emails
    title: Total Personal Domain Emails
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: single_value
    fields:
    - trchi_cda_level_001_base.count
    filters:
      trchi_cda_level_001_base.personal_domain_ind: '1'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 26
    col: 0
    width: 8
    height: 8
  - name: Sent Emails Outside Working Hours
    title: Sent Emails Outside Working Hours
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: looker_column
    fields:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.count
    - trchi_cda_level_001_base.outside_working_hours_ind
    pivots:
    - trchi_cda_level_001_base.outside_working_hours_ind
    fill_fields:
    - trchi_cda_level_001_base.date_beg_source_week
    sorts:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.outside_working_hours_ind
    limit: 500
    dynamic_fields:
    - table_calculation: outside_working_hours_of_total
      label: Outside Working Hours % of Total
      expression: round(${outside_working_hours_emails} / ${total_emails_sent}, 2)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: outside_working_hours_emails
      label: Outside Working Hours Emails
      expression: 'coalesce(pivot_index(${trchi_cda_level_001_base.count}, 2), 0) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: total_emails_sent
      label: Total Emails Sent
      expression: 'coalesce(pivot_index(${trchi_cda_level_001_base.count}, 1), 0)
        + coalesce(pivot_index(${trchi_cda_level_001_base.count}, 2), 0) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types:
      personal_domain_of_total: line
      outside_working_hours_of_total: line
    y_axes:
    - label:
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: outside_working_hours_emails
        name: Outside Working Hours Emails
        axisId: outside_working_hours_emails
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "#%"
      series:
      - id: outside_working_hours_of_total
        name: Outside Working Hours % of Total
        axisId: outside_working_hours_of_total
    x_axis_label: Week
    hidden_fields:
    - trchi_cda_level_001_base.count
    - total_emails_sent
    x_axis_datetime_label: "%B %Y"
    hide_legend: true
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 34
    col: 8
    width: 11
    height: 8
  - name: Sent Emails to External Domain
    title: Sent Emails to External Domain
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: looker_column
    fields:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.count
    - trchi_cda_level_001_base.external_domain_ind
    pivots:
    - trchi_cda_level_001_base.external_domain_ind
    fill_fields:
    - trchi_cda_level_001_base.date_beg_source_week
    sorts:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.external_domain_ind
    limit: 500
    dynamic_fields:
    - table_calculation: external_domain_of_total
      label: External Domain % of Total
      expression: round(pivot_index(${trchi_cda_level_001_base.count}, 2) / ${total_emails_sent},
        2)
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: external_domain_emails
      label: External Domain Emails
      expression: "pivot_index(${trchi_cda_level_001_base.count}, 2) \n"
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: total_emails_sent
      label: Total Emails Sent
      expression: 'pivot_index(${trchi_cda_level_001_base.count}, 1) + pivot_index(${trchi_cda_level_001_base.count},
        2) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types:
      external_domain_of_total: line
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: external_domain_emails
        name: External Domain Emails
        axisId: external_domain_emails
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "#%"
      series:
      - id: external_domain_of_total
        name: External Domain % of Total
        axisId: external_domain_of_total
    x_axis_label: Week
    hidden_fields:
    - trchi_cda_level_001_base.count
    - total_emails_sent
    x_axis_datetime_label: "%B %Y"
    hide_legend: true
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 18
    col: 8
    width: 11
    height: 8
  - name: Sent Emails to Personal Domain
    title: Sent Emails to Personal Domain
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: looker_column
    fields:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.count
    - trchi_cda_level_001_base.personal_domain_ind
    pivots:
    - trchi_cda_level_001_base.personal_domain_ind
    fill_fields:
    - trchi_cda_level_001_base.date_beg_source_week
    sorts:
    - trchi_cda_level_001_base.date_beg_source_week
    - trchi_cda_level_001_base.personal_domain_ind
    limit: 500
    dynamic_fields:
    - table_calculation: personal_domain_of_total
      label: Personal Domain % of Total
      expression: 'round(${personal_domain_emails} / ${total_emails_sent}, 2)

        '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: personal_domain_emails
      label: Personal Domain Emails
      expression: 'coalesce(pivot_index(${trchi_cda_level_001_base.count}, 2), 0) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    - table_calculation: total_emails_sent
      label: Total Emails Sent
      expression: 'coalesce(pivot_index(${trchi_cda_level_001_base.count}, 1),0) +
        coalesce(pivot_index(${trchi_cda_level_001_base.count}, 2),0) '
      value_format:
      value_format_name:
      _kind_hint: supermeasure
      _type_hint: number
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types:
      personal_domain_of_total: line
    y_axes:
    - label: ''
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: ''
      series:
      - id: personal_domain_emails
        name: Personal Domain Emails
        axisId: personal_domain_emails
    - label:
      maxValue:
      minValue:
      orientation: right
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom:
      type: linear
      unpinAxis: false
      valueFormat: "#%"
      series:
      - id: personal_domain_of_total
        name: Personal Domain % of Total
        axisId: personal_domain_of_total
    x_axis_label: Week
    hidden_fields:
    - trchi_cda_level_001_base.count
    - total_emails_sent
    x_axis_datetime_label: "%B %Y"
    hide_legend: true
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    row: 26
    col: 8
    width: 11
    height: 8
  - name: Total Outside Working Hours Emails
    title: Total Outside Working Hours Emails
    model: trchi_02215
    explore: trchi_cda_level_001_base
    type: single_value
    fields:
    - trchi_cda_level_001_base.count
    filters:
      trchi_cda_level_001_base.outside_working_hours_ind: '1'
    limit: 500
    custom_color_enabled: false
    custom_color: forestgreen
    show_single_value_title: true
    show_comparison: false
    comparison_type: value
    comparison_reverse_colors: false
    show_comparison_label: true
    stacking: ''
    show_value_labels: false
    label_density: 25
    legend_position: center
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_view_names: true
    limit_displayed_rows: false
    y_axis_combined: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    x_axis_scale: auto
    y_axis_scale_mode: linear
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    show_null_points: true
    point_style: none
    interpolation: linear
    series_types: {}
    y_axes:
    - label: Weekly Count
      maxValue:
      minValue:
      orientation: left
      showLabels: true
      showValues: true
      tickDensity: default
      tickDensityCustom: 5
      type: linear
      unpinAxis: false
      valueFormat:
      series:
      - id: trchi_cda_level_001_base.count
        name: Trchi Cda Level 001 Base Count
        axisId: trchi_cda_level_001_base.count
    x_axis_label: Week
    x_axis_datetime_label: "%B %Y"
    series_colors:
      trchi_cda_level_001_base.count: "#a9c574"
    listen:
      Select date range: trchi_cda_level_001_base.date_beg_source_date
      Select custodian (Turgeon or Michaud): trchi_cda_level_001_base.custodian
    note_state: collapsed
    note_display: below
    note_text: ''
    row: 34
    col: 0
    width: 8
    height: 8
  filters:
  - name: Select custodian (Turgeon or Michaud)
    title: Select custodian (Turgeon or Michaud)
    type: string_filter
    default_value: ''
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
    required: false
    suggestions: ["Turgeon_Jacques", "Michaud_Veronique"]
  - name: Select date range
    title: Select date range
    type: date_filter
    default_value: 2017/01/02 to 2017/12/11
    model:
    explore:
    field:
    listens_to_filters: []
    allow_multiple_values: true
    required: false
