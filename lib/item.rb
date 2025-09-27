class Item

  attr_reader :code, :name, :price

  PRODUCTS = 
  {
    'GR1' => { name: 'Green tea', price: 3.11 },
    'SR1' => { name: 'Strawberries', price: 5.00 },
    'CF1' => { name: 'Coffee', price: 11.23 }
  }

  def initialize(code)
    product = PRODUCTS[code]
    raise ArgumentError, "Invalid product code: #{code}" unless product

    @code = code
    @name = product[:name]
    @price = product[:price]
  end
end
