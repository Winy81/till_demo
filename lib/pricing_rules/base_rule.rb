module PricingRule
  class BaseRule

    def apply(items)
      0
    end

    private
 
    def select_items(items, product_code)
      matching_items = items.select { |item| item.code == product_code }
    end
  end
end