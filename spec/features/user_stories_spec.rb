#   As an air traffic controller
# So planes can land safely at my airport
# I would like to instruct a plane to land

describe 'Feature test for Airport class' do 
  it 'lands planes at an airport, instruct planes to land' do 
    airport = Airport.new
    plane = Plane.new
    expect { airport.land(plane) }.not_to raise_error
  end
end
