describe 'Airport Challenge' do
  specify 'a pilot can land a plane at an airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
  end

  specify 'a pilot can take off from an airport' do
    plane = Plane.new
    airport = Airport.new
    airport.take_off(plane)
  end

  specify 'a plane cannot be landed if the airport is full' do
    plane1 = Plane.new
    plane2 = Plane.new
    airport = Airport.new
    airport.land(plane1)
    message = 'Cannot land since airport is full'
    expect { airport.land(plane2) }.to raise_error message
  end
end
