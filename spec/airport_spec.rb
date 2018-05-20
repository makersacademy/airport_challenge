require 'airport'

describe Airport do
  it 'responds to #land' do
    expect(subject). to respond_to :land
  end
end

describe '#land' do
  it 'lands a plane at an airport' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end
end
