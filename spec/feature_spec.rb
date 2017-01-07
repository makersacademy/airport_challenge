# feature tests

require 'plane.rb'
require 'weather.rb'

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport and confirm that it has landed


describe Plane do
  it 'can land at an airport' do
    airport = Airport.new
    subject.land(airport)
  end

  it 'can confirm plane has landed' do
    airport = Airport.new
    subject.land(airport)
    subject.confirm_landing(airport)
  end
end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

describe Plane do
  it 'can take off from an airport' do
    airport = Airport.new
    subject.takeoff(airport)
  end
  it 'can confirm it took off' do
    airport = Airport.new
    subject.confirm_takeoff(airport)
  end
end

describe Weather do
  it 'can get weather' do
  weather = subject.current_weather
  end
end
