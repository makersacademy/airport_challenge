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

  specify 'a plane cannot land when weather is stormy' do
    plane = Plane.new
    airport = Airport.new
    airport.stormy = true
    message = 'Unable to land due to stormy weather'
    expect { airport.land(plane) }.to raise_error message
  end

  xspecify 'a plane cannot takeoff when weather is stormy' do
    # set weather to stormy
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
    message = 'Unable to take off due to stormy weather'
    expect { airport.take_off(plane) }.to raise_error message
  end
end
