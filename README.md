# Workarea Margin

Currently in Development.

A Workarea Commerce plugin that enables product reviews.

## Overview

- Allows adding cost to pricing skus
- Pricing admin view will show margin based on regular price or sale price depending on the sale flag

## Getting Started

Add the gem to your application's Gemfile:

```ruby
# ...
gem 'workarea-margin', git: 'https://github.com/Brandongoodman615/workarea-margin'
# ...
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

## Screenshots

![Pricing List Preview](app/assets/images/pricing_list.png)

![Add Cost Preview](app/assets/images/add_cost.png)

## Append Points

Append partials need to be added to your platform to work:

These append points can be added between any column on the pricing table, they will be in order of cost then margin. The default location is before MSRP, but it could go after and make sense as well.

```haml
This should be updated in the Workarea codebase soon.

admin/app/views/workarea/admin/pricing_skus/index.html.haml

- if @search.results.any?
<<<<<<< HEAD
<<<<<<< Updated upstream
      %table.index-table
        %thead
          %tr
            %th.index-table__control-cell
              .checkbox
                = check_box_tag 'select_all', nil, false, id: 'select_all', class: 'checkbox__input', data: { bulk_action_select_all: '' }
                = label_tag 'select_all', t('workarea.admin.bulk_actions.select_all'), class: 'checkbox__label'
            %th= t('workarea.admin.fields.sku')
            = append_partials('admin.additional_fields_labels') # <---- Labels
            %th.align-right= t('workarea.admin.fields.msrp')
            %th.align-right= t('workarea.admin.fields.regular')
            %th.align-right= t('workarea.admin.fields.sale_price')
            %th.align-center= t('workarea.admin.fields.on_sale')
            %th.align-center= t('workarea.admin.fields.allow_discounting')
            %th= t('workarea.admin.fields.updated_at')
        %tbody
          - @search.results.each do |result|
            %tr.index-table__row{ class: ('index-table__row--inactive' unless result.active) }
              %td.index-table__control-cell
                .checkbox
                  = check_box_tag 'global_id', result.to_gid_param, false, class: 'checkbox__input', id: dom_id(result), data: { bulk_action_item: '' }
                  = label_tag dom_id(result), '', class: 'checkbox__label', title: t('workarea.admin.bulk_actions.add_summary_button')
              %td
                = link_to result.id, pricing_sku_path(result)
                = upcoming_changesets_icon_for(result)
              = append_partials('admin.additional_fields', result: result) # <---- Data
              %td.align-right= number_to_currency result.msrp
              %td.align-right= number_to_currency result.regular_price
              %td.align-right= number_to_currency result.sale_price
              %td.align-center= t("workarea.admin.#{result.on_sale?}")
              %td.align-center= t("workarea.admin.#{result.discountable?}")
              %td= local_time_ago(result.updated_at)
```

```haml
admin/app/views/workarea/admin/pricing_skus/new.html.haml

.property
  %span.property__name= t('workarea.admin.fields.discountable')
  = toggle_button_for 'sku[discountable]', @sku.discountable?, title_true: t('workarea.admin.pricing_skus.allow_discounting'), title_false: t('workarea.admin.pricing_skus.disallow_discounting')

= append_partials('admin.add_cost', sku: @sku) # <---- Add Cost Box

.property
  = label_tag 'sku_msrp', t('workarea.admin.fields.msrp'), class: 'property__name'
  = currency_symbol
  = text_field_tag 'sku[msrp]', @sku.msrp, class: 'text-box text-box--small', placeholder: t('workarea.admin.pricing_skus.msrp_placeholder')
```

```haml
admin/app/views/workarea/admin/pricing_skus/edit.html.haml

.property
  = label_tag 'sku[tax_code]', t('workarea.admin.fields.tax_code'), class: 'property__name'
  = text_field_tag 'sku[tax_code]', @sku.tax_code, class: 'text-box'

= append_partials('admin.add_cost', sku: @sku) # <---- Add Cost Box

.property
  = label_tag 'sku_msrp', t('workarea.admin.fields.msrp'), class: 'property__name'
  = currency_symbol
  = text_field_tag 'sku[msrp]', @sku.msrp, class: 'text-box text-box--small'
```

```haml
admin/app/views/workarea/admin/pricing_skus/_cards.html.haml

.card__body
          %ul.list-reset
            %li
              %strong #{t('workarea.admin.fields.active')}?
              = check_box_tag 'sku', 'active', model.active, disabled: true
            %li
              %strong #{t('workarea.admin.fields.tax_code')}:
              = model.tax_code.presence || '(none)'
            = append_partials('admin.card_cost_and_margin', model: model) # <---- Card Data
            %li
              %strong #{t('workarea.admin.fields.msrp')}:
              - if model.msrp.blank?
                = t('workarea.admin.cards.attributes.no_value')
              - else
                = number_to_currency model.msrp
            %li
              %strong #{t('workarea.admin.fields.on_sale')}:
              = model.on_sale?.to_s.titleize
            %li
              %strong #{t('workarea.admin.fields.discountable')}:
              = model.discountable?.to_s.titleize
=======
=======
>>>>>>> 0d1586ef8ca860e8189e49f41d84ba010adce0ab
  %table.index-table
    %thead
      %tr
        %th.index-table__control-cell
          .checkbox
            = check_box_tag 'select_all', nil, false, id: 'select_all', class: 'checkbox__input', data: { bulk_action_select_all: '' }
            = label_tag 'select_all', t('workarea.admin.bulk_actions.select_all'), class: 'checkbox__label'
        %th= t('workarea.admin.fields.sku')
<<<<<<< HEAD
**      = append_partials('admin.pricing_skus_additional_field_labels') **LABEL**
=======
        = append_partials('admin.pricing_skus_additional_field_labels')
>>>>>>> 0d1586ef8ca860e8189e49f41d84ba010adce0ab
        %th.align-right= t('workarea.admin.fields.msrp')
        %th.align-right= t('workarea.admin.fields.regular')
        %th.align-right= t('workarea.admin.fields.sale_price')
        %th.align-center= t('workarea.admin.fields.on_sale')
        %th.align-center= t('workarea.admin.fields.allow_discounting')
        %th= t('workarea.admin.fields.updated_at')
    %tbody
      - @search.results.each do |result|
        %tr.index-table__row{ class: ('index-table__row--inactive' unless result.active) }
          %td.index-table__control-cell
            .checkbox
              = check_box_tag 'global_id', result.to_gid_param, false, class: 'checkbox__input', id: dom_id(result), data: { bulk_action_item: '' }
              = label_tag dom_id(result), '', class: 'checkbox__label', title: t('workarea.admin.bulk_actions.add_summary_button')
          %td
            = link_to result.id, pricing_sku_path(result)
            = upcoming_changesets_icon_for(result)
<<<<<<< HEAD
**        = append_partials('admin.pricing_skus_additional_fields', result: result) **FIELD**
=======
          = append_partials('admin.pricing_skus_additional_fields', result: result)
>>>>>>> 0d1586ef8ca860e8189e49f41d84ba010adce0ab
          %td.align-right= number_to_currency result.msrp
          %td.align-right= number_to_currency result.regular_price
          %td.align-right= number_to_currency result.sale_price
          %td.align-center= t("workarea.admin.#{result.on_sale?}")
          %td.align-center= t("workarea.admin.#{result.discountable?}")
          %td= local_time_ago(result.updated_at)
<<<<<<< HEAD
>>>>>>> Stashed changes
=======
>>>>>>> 0d1586ef8ca860e8189e49f41d84ba010adce0ab
```

## Workarea Commerce Documentation

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

## License

Workarea Reviews is released under the [Business Software License](LICENSE)
