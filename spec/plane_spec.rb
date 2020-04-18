require './lib/plane'
require './lib/airport'

describe Plane do

  it 'lands at airport' do
    airport = Airport.new
    subject.land_at_airport(airport)
    expect(airport.planes.count).to eq(1)
  end

  it 'leaves airport' do
    airport = Airport.new
    airport.planes << subject
    subject.leave_airport(airport)
    expect(airport.planes.count).to eq(0)
  end

end
