module Workarea
  Workarea.append_partials(
    'admin.cost_and_margin_labels',
    'workarea/admin/pricing_skus/cost_and_margin_labels'
  )

  Workarea.append_partials(
    'admin.cost_and_margin',
    'workarea/admin/pricing_skus/cost_and_margin'
  )

  Workarea.append_partials(
    'admin.add_cost',
    'workarea/admin/pricing_skus/add_cost'
  )
end