describe 'user story' do
  #user stories

  it 'so planes land at airports, instruct a plane to land' do
    # write out code I'm looking for
    airport = Airport.new
    plane = Plane.new
    weather = Stormy_Weather.new
    expect { airport.land(plane, weather) }.not_to raise_error
  end
end
