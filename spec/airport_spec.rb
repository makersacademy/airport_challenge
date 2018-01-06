require './lib/airport.rb'

describe Airport do

  it 'instruct a plane to land at an airport' do
    airport = Airport.new
    plane = Plane.new
    airport.land(plane)
    expect(airport).to respond_to(:land).with(1).argument
  end
end
