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
    total_discount = 0

    @pricing_rules.each do |rule|
      result = rule.apply(@items)
      total_discount += result[:discount]
    end

    final_price = (base_total - total_discount).round(2)
  end
end
