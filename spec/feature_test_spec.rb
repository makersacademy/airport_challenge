require 'Airport'

describe 'feature test' do

  it 'allows planes to land and take off when sunny' do
    weather = Weather.new
    allow(weather).to receive(:state) {:sunny}
    plane1 = Plane.new
    plane2 = Plane.new
    plane3 = Plane.new
    airport = Airport.new(5)
    airport.incoming_plane(plane1, weather)
    airport.incoming_plane(plane2, weather)
    airport.incoming_plane(plane3, weather)
    airport.departing_plane(plane1, weather)
    airport.departing_plane(plane2, weather)
    airport.departing_plane(plane3, weather)
  end
  
end