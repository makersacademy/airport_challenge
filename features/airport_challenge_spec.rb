describe 'Airport Challenge' do
  specify 'a pilot can land a plane at an airport' do
    plane = Plane.new
    airport = Airport.new
    airport.land(plane)
  end
end
