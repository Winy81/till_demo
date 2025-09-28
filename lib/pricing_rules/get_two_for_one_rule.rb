require_relative 'base_rule'

module PricingRule
  class GetTwoForOneRule < BaseRule

    def apply(items)
      product_code = rule_config['product_code']

      matching_items = select_items(items, product_code)
      return { discount: 0 } if matching_items.empty?

      price_per_item = matching_items.first.price
      quantity = matching_items.size

      free_quantity = quantity / 2
      discount = free_quantity * price_per_item

      { discount: discount }
    end
  end
end