require './lib/plane.rb'

describe Plane do
  it 'should instruct plane to land at the specified airport' do
    weather_double = double(:weather, get: "sunny")
    plane = Plane.new(weather_double)
    airport_double = double(:airport, land_plane: "")

    plane.land(airport_double)

    expect(airport_double).to have_received(:land_plane).with(plane)
  end

  it 'should instruct plane to take off and get back confirmation that plane is airborne' do
    weather_double = double(:weather, get: "sunny")
    plane = Plane.new(weather_double)

    expect(plane.take_off).to eq(true)
  end

  it 'should prevent takeoff when weather is stormy' do
    weather_double = double(:weather, get: "stormy")
    plane = Plane.new(weather_double)

    expect(plane.take_off).to eq(false)
  end
end
