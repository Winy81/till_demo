#!/usr/bin/env ruby

require 'yaml'
require_relative '../lib/checkout'
require_relative '../lib/item'
require_relative '../lib/pricing_rules/base_rule'
require_relative '../lib/pricing_rules/get_two_for_one_rule'
require_relative '../lib/pricing_rules/bulk_discount_rule'
require_relative '../lib/pricing_rules/discount_rule'

config_path = File.expand_path('../config/enabled_pricing_rules.yml', __dir__)
enabled_rules_config = YAML.load_file(config_path)

pricing_rules = []
pricing_rules << PricingRule::GetTwoForOneRule.new if enabled_rules_config['PricingRule::GetTwoForOneRule']
pricing_rules << PricingRule::BulkDiscountRule.new if enabled_rules_config['PricingRule::BulkDiscountRule']
pricing_rules << PricingRule::DiscountRule.new if enabled_rules_config['PricingRule::DiscountRule']

co = Checkout.new(pricing_rules)

# Example basket: GR1, SR1, GR1, GR1, CF1
products_in_basket = %w[GR1 SR1 GR1 GR1 CF1]

products_in_basket.each { |code| co.scan(code) }

puts '=================================================='
puts "Scanned basket: #{products_in_basket.join(', ')}"
puts "Active discount rules: #{enabled_rules_config.select { |_k, v| v }.keys.map { |k| k.split('::').last }.join(', ')}"
puts "Total: £#{format('%.2f', co.total)}"
puts '=================================================='