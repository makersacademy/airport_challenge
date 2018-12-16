describe 'User Stories' do

 # As an air traffic controller
 # So planes can safely land at my airport
 # I would like to instruct a plane to land
  it 'so an airplane can land safely' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end

  it 'allows a plane to take off' do
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error
  end
end
