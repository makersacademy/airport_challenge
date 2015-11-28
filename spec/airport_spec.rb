require 'airport'

describe Airport do
  it 'instructs a plane to land' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
  end

it 'instructs a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq plane
end

end
