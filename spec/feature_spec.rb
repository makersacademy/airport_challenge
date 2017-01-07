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

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

describe Plane do
    it 'cannot take off in stormy weather' do
      airport = Airport.new
      weather = 'stormy'
      subject.land(airport)
      expect{subject.takeoff(airport, weather)}.to raise_error("Weather is too stormy")
      expect(subject.confirm_takeoff(airport)).to eq false
    end

    it 'can take off otherwise' do
      airport = Airport.new
      weather = 'sunny'
      subject.land(airport)
      expect{subject.takeoff(airport, weather)}.not_to raise_error
      expect(subject.confirm_takeoff(airport)).to eq true
    end
end


# As an air traffic controller
# To ensure safety
# I want to prevent landing when weather is stormy

describe Plane do
    it 'cannot land in stormy weather' do
      airport = Airport.new
      weather = 'stormy'
      expect{subject.land(airport, weather)}.to raise_error("Weather is too stormy")
      expect(subject.confirm_landing(airport)).to eq false
    end

    it 'can land otherwise' do
      airport = Airport.new
      weather = 'sunny'
      expect{subject.land(airport, weather)}.not_to raise_error
      expect(subject.confirm_landing(airport)).to eq true
    end
end
