require 'weather'

describe Weather do

  it 'Unit test: Allows the weather to become stormy' do
    weather = Weather.new
    expect(weather.stormy).to eq false
  end

  # it 'Unit test: Allows plane to take off if the weather is definitely sunny' do
  #   weather = Weather.new
  #   plane = Plane.new
  #   airport = Airport.new
  #   weather.sunny
  #   airport.land(plane)
  #   expect(airport.take_off).to eq([])
  # end
  #
  # it 'tests taking off when weather happens to be sunny' do
  #   weather = FakeSunnyWeather.new
  #   plane = Plane.new
  #   airport = Airport.new
  #   weather.sunny?
  #   airport.land(plane)
  #   expect(planes.take_off).to eq([])
  # end

  # it 'tests taking off when weather happens to be stormy' do
  #   weather = FakeStormyWeather.new
  #   plane = Plane.new
  #   airport = Airport.new
  #   airport.land(plane)
  #   weather.sunny?
  #   expect(planes.take_off).to eq([plane])
  # end

  # it 'tests the plane can take off in sunny weather' do
  #   weather = FakeSunnyWeather.new
  #   weather.take_off
  # end

end
