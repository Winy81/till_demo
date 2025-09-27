require_relative 'item'

class Checkout

  def initialize(pricing_rules = nil)
    @pricing_rules = pricing_rules
    @items = []
  end

  def scan(code)
    @items << Item.new(code)
  end

  def total
    base_total = @items.sum(&:price) || 0
    total_discount = @pricing_rules.apply(@items)

    final_price = (base_total - total_discount).round(2)
  end
end
