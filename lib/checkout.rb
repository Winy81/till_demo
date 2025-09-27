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
    @items.sum(&:price).round(2) || nil
  end
end
