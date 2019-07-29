describe 'User Stories' do

  it 'so planes land at airports, instruct a plane to land' do
    airport = Airport.new
    plane = Plane.new
    allow(airport).to receive(:weather).and_return(:fine)
    expect { airport.land(plane) }.not_to raise_error
  end
end
