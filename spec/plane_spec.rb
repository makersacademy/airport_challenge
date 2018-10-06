require 'plane'
require 'pry'

describe Plane do
  let(:plane) { Plane.new }
  describe '#land' do
    it 'allows a plane to land at an airport' do
      weather = double(:weather, check_weather: "fine")
      expect(plane.land(weather)).to eq "The plane has landed"
    end
    it 'will not allow a plane to land if the weather is stormy' do
      weather = double(:weather, check_weather: "stormy")
      forcast = weather.check_weather
      expect { plane.land(forcast) }.to raise_error "The weather is stormy"
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off and shows that the plane has left' do
      weather = double(:weather, check_weather: "fine")
      expect(plane.take_off(weather)).to eq "The plane has taken off"
    end
    it 'will not allow the plane to take off if the weather is stormy' do
      weather = double(:weather, check_weather: "stormy")
      forcast = weather.check_weather
      expect { plane.take_off(forcast) }.to raise_exception "The weather is stormy"
    end
  end
end
