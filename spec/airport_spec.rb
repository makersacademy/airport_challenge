require 'airport'

describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq true
  end
end
