require_relative 'spec_helper'

RSpec.describe Checkout do

  it 'calculates total for basket GR1,SR1,GR1,GR1,CF1' do
    co = Checkout.new()
    %w[GR1 SR1 GR1 GR1 CF1].each { |code| co.scan(code) }
    expect(co.total).to eq(25.56)
  end

  it 'calculates total for basket GR1,GR1' do
    co = Checkout.new()
    %w[GR1 GR1].each { |code| co.scan(code) }
    expect(co.total).to eq(6.22)
  end

  it 'calculates total for basket SR1,SR1,GR1,SR1' do
    co = Checkout.new()
    %w[SR1 SR1 GR1 SR1].each { |code| co.scan(code) }
    expect(co.total).to eq(18.11)
  end

  it 'calculates total for basket GR1,CF1,SR1,CF1,CF1' do
    co = Checkout.new()
    %w[GR1 CF1 SR1 CF1 CF1].each { |code| co.scan(code) }
    expect(co.total).to eq(41.8)
  end

end