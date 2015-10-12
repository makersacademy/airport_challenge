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
end
