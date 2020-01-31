module Workarea
  Workarea.append_partials(
    'admin.additional_fields_labels',
    'workarea/admin/pricing_skus/additional_fields_labels'
  )

  Workarea.append_partials(
    'admin.additional_fields',
    'workarea/admin/pricing_skus/additional_fields'
  )

  Workarea.append_partials(
    'admin.add_cost',
    'workarea/admin/pricing_skus/add_cost'
  )

  Workarea.append_partials(
    'admin.card_cost_and_margin',
    'workarea/admin/pricing_skus/card_cost_and_margin'
  )
end