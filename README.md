# Till Demo Project

A simple Ruby checkout system with configurable pricing rules.

## Installation

```bash
git clone https://github.com/Winy81/till_demo.git
cd till_demo
bundle install
Required Configs
config/pricing_rules.yml

config/enabled_pricing_rules.yml

config/products.yml

Usage

Run Script
bash
Copy code
chmod +x bin/run_checkout.rb
bin/run_checkout.rb

or

ruby bin/run_checkout.rb
Terminal Run (As Requested)
ruby
Copy code
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

Example Output

Active discount rules: GetTwoForOneRule, BulkDiscountRule, DiscountRule
Scanned basket: GR1, SR1, GR1, GR1, CF1
Total: £22.45

Run Tests
bash
Copy code
rspec



