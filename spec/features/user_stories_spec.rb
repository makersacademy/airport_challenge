#   As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

describe 'Feature test for Airport class' do 
  it 'lands planes at an airport, instruct planes to land' do 
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
# As an air traffic controller 
# So I can get passengers on the way to their destination 
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it 'takes off at an airport' do 
    airport = Airport.new
    plane = Plane.new
    expect { airport.take_off(plane) }.not_to raise_error 
  end
end
