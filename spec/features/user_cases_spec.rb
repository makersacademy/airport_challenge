describe 'These are user stories' do
# As an air traffic controller 
# So I can get passengers to a destination 
# I want to instruct a plane to land at an airport.
  it 'instruct a plan to land at the airport.' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end