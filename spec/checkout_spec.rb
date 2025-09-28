require 'yaml'
require_relative '../lib/checkout'
require_relative '../lib/item'
require_relative '../lib/pricing_rules/base_rule'
require_relative '../lib/pricing_rules/get_two_for_one_rule'
require_relative '../lib/pricing_rules/bulk_discount_rule'
require_relative '../lib/pricing_rules/discount_rule'

RSpec.describe Checkout do

  #TODO driven by config file
  let(:pricing_rules) do
    [
      PricingRule::GetTwoForOneRule.new(),
      PricingRule::BulkDiscountRule.new(),
      PricingRule::DiscountRule.new()
    ]
  end
  #
  subject(:checkout) { described_class.new(pricing_rules) }

  context 'with sample baskets' do
    it 'calculates total for GR1, SR1, GR1, GR1, CF1' do
      %w[GR1 SR1 GR1 GR1 CF1].each { |code| checkout.scan(code) }
      expect(checkout.total).to eq(22.45)
    end

    it 'calculates total for GR1, GR1' do
      %w[GR1 GR1].each { |code| checkout.scan(code) }
      expect(checkout.total).to eq(3.11)
    end

    it 'calculates total for SR1, SR1, GR1, SR1' do
      %w[SR1 SR1 GR1 SR1].each { |code| checkout.scan(code) }
      expect(checkout.total).to eq(16.61)
    end

    it 'calculates total for GR1, CF1, SR1, CF1, CF1' do
      %w[GR1 CF1 SR1 CF1 CF1].each { |code| checkout.scan(code) }
      expect(checkout.total).to eq(30.57)
    end
  end

  #TODO on and off when config is exist
  context 'with anebled config config values' do

  let(:config) { YAML.load_file(File.expand_path('../config/pricing_rules.yml', __dir__)) }

    it 'has product_code for GetTwoForOneRule' do
      rule_config = config['PricingRule::GetTwoForOneRule']
      expect(rule_config).not_to be_nil
      expect(rule_config['product_code']).not_to be_nil
    end

    it 'has product_code, minimum_quantity and discount_price for BulkDiscountRule' do
      rule_config = config['PricingRule::BulkDiscountRule']
      expect(rule_config).not_to be_nil
      expect(rule_config['product_code']).not_to be_nil
      expect(rule_config['minimum_quantity_for_discount']).not_to be_nil
      expect(rule_config['discounted_price_per_item']).not_to be_nil
    end

    it 'has product_code, minimum_quantity, discount factor for DiscountRule' do
      rule_config = config['PricingRule::DiscountRule']
      expect(rule_config).not_to be_nil
      expect(rule_config['product_code']).not_to be_nil
      expect(rule_config['minimum_quantity_for_discount']).not_to be_nil
      expect(rule_config['discount_factor']).not_to be_nil
    end
  end
end