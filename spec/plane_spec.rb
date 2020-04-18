require './lib/plane'
require './lib/airport'

describe Plane do

  it 'lands at airport' do
    airport = Airport.new
    subject.land_at_airport(airport)
    expect(airport.planes[0]).to eq(subject)
  end

  it 'leaves airport' do
    airport = Airport.new
    airport.planes << subject
    subject.leave_airport(airport)
    expect(airport.planes.empty?).to eq(true)
  end

end
