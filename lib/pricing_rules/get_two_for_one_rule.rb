require_relative 'base_rule'

module PricingRule
  class PricingRule::GetTwoForOneRule < PricingRule::BaseRule

    def apply(items)
      #TODO Make config-able
      product_code = 'GR1'
      #
      matching_items = items.select { |item| item.code == product_code }
      return { discount: 0 } if matching_items.empty?

      price_per_item = matching_items.first.price
      quantity = matching_items.size

      free_quantity = quantity / 2
      discount = free_quantity * price_per_item

      { discount: discount }
    end
  end
end