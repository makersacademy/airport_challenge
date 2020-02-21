require './lib/airport.rb'

describe Airport do
  it 'lands a plane' do
    airport = Airport.new
    plane = Plane.new
    expect(airport.land(plane)).to eq plane
	end
end
