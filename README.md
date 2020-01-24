# Workarea Margin

Currently in Development.

A Workarea Commerce plugin that enables product reviews.

## Overview

- Allows adding cost to pricing skus
- Pricing admin view will show margin based on regular price or sale price depending on the sale flag

## Getting Started

While in Development use the Github path in your Gemfile:

```ruby
gem 'workarea-margin', git: 'https://github.com/Brandongoodman615/workarea-margin'
```

Add the gem to your application's Gemfile:

```ruby
gem 'workarea-margin'
```

Update your application's bundle.

```bash
cd path/to/application
bundle
```

## Append Points

Append partials need to be added to your platform to work:

```ruby
admin/app/views/workarea/admin/pricing_skus/index.html.haml

- if @search.results.any?
      %table.index-table
        %thead
          %tr
            %th.index-table__control-cell
              .checkbox
                = check_box_tag 'select_all', nil, false, id: 'select_all', class: 'checkbox__input', data: { bulk_action_select_all: '' }
                = label_tag 'select_all', t('workarea.admin.bulk_actions.select_all'), class: 'checkbox__label'
            %th= t('workarea.admin.fields.sku')
            = append_partials('admin.margin_labels')
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
              = append_partials('admin.margin', result: result)
              %td.align-right= number_to_currency result.msrp
              %td.align-right= number_to_currency result.regular_price
              %td.align-right= number_to_currency result.sale_price
              %td.align-center= t("workarea.admin.#{result.on_sale?}")
              %td.align-center= t("workarea.admin.#{result.discountable?}")
              %td= local_time_ago(result.updated_at)
```

```ruby
admin/app/views/workarea/admin/pricing_skus/new.html.haml

.property
  %span.property__name= t('workarea.admin.fields.discountable')
  = toggle_button_for 'sku[discountable]', @sku.discountable?, title_true: t('workarea.admin.pricing_skus.allow_discounting'), title_false: t('workarea.admin.pricing_skus.disallow_discounting')

= append_partials('admin.add_margin', sku: @sku)

.property
  = label_tag 'sku_msrp', t('workarea.admin.fields.msrp'), class: 'property__name'
  = currency_symbol
  = text_field_tag 'sku[msrp]', @sku.msrp, class: 'text-box text-box--small', placeholder: t('workarea.admin.pricing_skus.msrp_placeholder')
```

```ruby
admin/app/views/workarea/admin/pricing_skus/edit.html.haml

.property
  = label_tag 'sku[tax_code]', t('workarea.admin.fields.tax_code'), class: 'property__name'
  = text_field_tag 'sku[tax_code]', @sku.tax_code, class: 'text-box'

= append_partials('admin.add_margin', sku: @sku)

.property
  = label_tag 'sku_msrp', t('workarea.admin.fields.msrp'), class: 'property__name'
  = currency_symbol
  = text_field_tag 'sku[msrp]', @sku.msrp, class: 'text-box text-box--small'
```

## Workarea Commerce Documentation

See [https://developer.workarea.com](https://developer.workarea.com) for Workarea Commerce documentation.

## License

Workarea Reviews is released under the [Business Software License](LICENSE)
