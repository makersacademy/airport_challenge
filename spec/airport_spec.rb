require 'airport'
require 'plane'

describe Airport do
  subject(:airport) { described_class.new }
  plane1 = Plane.new
  plane2 = Plane.new

  it 'allows a plane to land' do
    expect(airport.land(plane1)).to eq [plane1]
  end

  it 'shows planes in airport' do
    airport.land(plane1)
    airport.land(plane2)
    expect(airport.planes).to eq [plane1, plane2]
  end

  it 'checks if a plane has landed' do
    airport.land(plane1)
    expect(airport.landed?(plane1)). to be_truthy
    expect(airport.landed?(plane2)). to be_falsy
  end

end
