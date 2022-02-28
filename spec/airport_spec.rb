require 'airport'
require 'plane'

describe Airport do
  it 'allows plane to land at airport when instructed' do
    airport = Airport.new("Heathrow")
    expect(airport.land).to eq "plane has landed at Heathrow"
  end

  it 'allows plane to take off from airport when instructed' do
    airport = Airport.new("Heathrow")
    expect(airport.take_off).to eq "plane has taken off from Heathrow"
  end

end
