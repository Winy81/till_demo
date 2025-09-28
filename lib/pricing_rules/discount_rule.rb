require_relative 'base_rule'

module PricingRule
  class DiscountRule < BaseRule

    def apply(items)
      product_code = rule_config['product_code']
      minimum_quantity_for_discount = rule_config['minimum_quantity_for_discount']
      discount_factor = rule_config['discount_factor']

      matching_items = select_items(items, product_code)
      quantity = matching_items.size

      return { discount: 0 } if quantity < minimum_quantity_for_discount

      price_per_item = matching_items.first.price
      discounted_price_per_item = price_per_item * discount_factor

      discount = quantity * (price_per_item - discounted_price_per_item)

      { discount: discount }
    end
  end
end