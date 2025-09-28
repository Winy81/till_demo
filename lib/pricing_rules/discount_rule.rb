require_relative 'base_rule'

module PricingRule
  class DiscountRule < BaseRule

    def apply(items)
      # TODO: Make config-able
      product_code = 'CF1'
      minimum_quantity_for_discount = 3
      #
      discount_factor = 2.0 / 3.0

      matching_items = items.select { |item| item.code == product_code }
      quantity = matching_items.size

      return { discount: 0 } if quantity < minimum_quantity_for_discount

      price_per_item = matching_items.first.price
      discounted_price_per_item = price_per_item * discount_factor

      discount = quantity * (price_per_item - discounted_price_per_item)

      { discount: discount }
    end
  end
end