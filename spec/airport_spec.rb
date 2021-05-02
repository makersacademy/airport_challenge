require 'airport'

describe 'Airport' do
  it 'instantiates with a default capacity value of 4' do
    default_airport = Airport.new
    expect(default_airport.capacity).to eq 4
  end

  it 'can be instantiated with an overriden capacity value' do
    sixer_airport = Airport.new(6)
    expect(sixer_airport.capacity).to eq 6
  end
end
