
# Till demo project 

A simple Ruby checkout system with configurable pricing rules.


## Instalization

git clone https://github.com/Winy81/till_demo.git
cd till_demo
bundle install


## Required configs

pricing_rules.yml
enabled_pricing_rules.yml
products.yml


## Usage

Script run:

chmod +x bin/run_checkout.rb
bin/run_checkout.rb
or 
ruby bin/run_checkout.rb 


Terminal run (as requested):

require_relative 'lib/checkout'
require_relative 'lib/item'
require_relative 'lib/pricing_rules/base_rule'
require_relative 'lib/pricing_rules/get_two_for_one_rule'
require_relative 'lib/pricing_rules/bulk_discount_rule'
require_relative 'lib/pricing_rules/discount_rule'

pricing_rules = [
  PricingRule::GetTwoForOneRule.new,
  PricingRule::BulkDiscountRule.new,
  PricingRule::DiscountRule.new
]

co = Checkout.new(pricing_rules)
co.scan('GR1')
co.scan('SR1')
co.scan('GR1')
co.scan('GR1')
co.scan('CF1')
puts co.total


Example output:

Active discount rules: GetTwoForOneRule, BulkDiscountRule, DiscountRule
Scanned basket: GR1, SR1, GR1, GR1, CF1
Total: £22.45


## Run Tests

rspec



