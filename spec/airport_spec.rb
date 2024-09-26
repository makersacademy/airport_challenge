require 'Airport'

airport = Airport.new
plane = Aeroplane.new

describe airport do
 
  it 'can land the plane at the airport' do
    expect(airport.land(plane)).to eq [plane]
  end

  it 'lets the plane take off and confirm' do
    expect(airport.take_off).to eq plane
  end
end