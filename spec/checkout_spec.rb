require_relative 'spec_helper'

RSpec.describe Checkout do

  let(:pricing_rules) { [ PricingRule::GetTwoForOneRule.new(), PricingRule::DiscountRule.new() ] }

  it 'calculates total for basket GR1,SR1,GR1,GR1,CF1' do
    co = Checkout.new(pricing_rules)
    %w[GR1 SR1 GR1 GR1 CF1].each { |code| co.scan(code) }
    expect(co.total).to eq(22.45)
  end

  it 'calculates total for basket GR1,GR1' do
    co = Checkout.new(pricing_rules)
    %w[GR1 GR1].each { |code| co.scan(code) }
    expect(co.total).to eq(3.11)
  end

  it 'calculates total for basket SR1,SR1,GR1,SR1' do
    co = Checkout.new(pricing_rules)
    %w[SR1 SR1 GR1 SR1].each { |code| co.scan(code) }
    expect(co.total).to eq(18.11)
  end

  it 'calculates total for basket GR1,CF1,SR1,CF1,CF1' do
    co = Checkout.new(pricing_rules)
    %w[GR1 CF1 SR1 CF1 CF1].each { |code| co.scan(code) }
    expect(co.total).to eq(30.57)
  end

end