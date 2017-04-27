describe 'User stories - feature tests' do
  # As an air traffic controller
  # So I can get passengers to a destination
  # I want to instruct a plane to land at an airport and confirm that it has landed end
  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    allow(plane).to receive(:airborne?) { true }
    allow(airport).to receive(:stormy?) { false }
    expect { airport.land(plane) }.not_to raise_error
  end
end
