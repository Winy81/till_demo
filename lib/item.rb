require 'yaml'

class Item
  attr_reader :code, :name, :price

  CONFIG_PATH = File.expand_path('../../config/products.yml', __FILE__)
  PRODUCTS = YAML.load_file(CONFIG_PATH)

  def initialize(code)
    product = PRODUCTS[code]
    raise ArgumentError, "Invalid product code: #{code}" unless product

    @code = code
    @name = product['name']
    @price = product['price']
  end
end