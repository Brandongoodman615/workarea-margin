require 'test_helper'

module Workarea
  module Admin
    class PricingSkuViewModelTest < TestCase
      setup :set_pricing_sku

      def set_pricing_sku
        @sku = create_pricing_sku(cost: 5)
      end

      def test_margin
        assert_equal(5.to_m, PricingSkuViewModel.new(@sku).show_cost)

        @sku.set(prices: [{ regular: 20 }])
        assert_equal(75, PricingSkuViewModel.new(@sku).margin)

        @sku.set(prices: [{ regular: 20, sale: 10, on_sale: true }])
        assert_equal(50, PricingSkuViewModel.new(@sku).margin)
      end
    end
  end
end