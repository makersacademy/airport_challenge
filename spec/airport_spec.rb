require 'airport'

describe Airport do

  subject(:airport) { described_class.new }

  it '#set_capacity method sets capacity correctly' do
    airport.set_capacity(10)
    expect(airport.capacity).to eq(10)
    expect{airport.set_capacity(-5)}.to raise_error "Capacity must be greater than 0"
  end

end