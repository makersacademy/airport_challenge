require 'plane'
require 'pry'

describe Plane do
  let(:plane) { Plane.new }
  let(:good_weather) {Weather.new("no")}
  let(:bad_weather) {Weather.new("yes")}
  describe '#land' do
    it 'allows a plane to land at an airport' do
      expect(plane.land(good_weather)).to eq "The plane has landed"
    end
    it 'will not allow a plane to land if the weather is stormy' do
      expect { plane.land(bad_weather.stormy) }.to raise_error "The weather is stormy"
    end
  end

  describe '#take_off' do
    it 'allows a plane to take off and shows that the plane has left' do
      expect(plane.take_off(good_weather.stormy)).to eq "The plane has taken off"
    end
    it 'allows a plane to take off if the weather is not stormy' do
      expect { plane.take_off(bad_weather.stormy) }.to raise_error "The weather is stormy"
    end
  end
end
