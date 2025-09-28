require_relative 'base_rule'

module PricingRule
  class BulkDiscountRule < BaseRule

    def apply(items)
      # TODO: Make config-able
      product_code = 'SR1'
      minimum_quantity_for_discount = 3
      discounted_price_per_item = 4.50
      #
      matching_items = select_items(items, product_code)
      quantity = matching_items.size

      return { discount: 0 } if quantity < minimum_quantity_for_discount

      price_per_item = matching_items.first.price
      discount = quantity * (price_per_item - discounted_price_per_item)

      { discount: discount }
    end
  end
end