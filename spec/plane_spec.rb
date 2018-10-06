require 'plane'
require 'pry'

describe Plane do
  let(:plane) { Plane.new }
  describe '#land' do
    it 'allows a plane to land at an airport' do
      expect(plane.land).to eq "The plane has landed"
    end
  end
  describe '#take_off' do
    it 'allows a plane to take off and shows that the plane has left' do
      weather = Weather.new("no")
      expect(plane.take_off(weather.stormy)).to eq "The plane has taken off"
    end
    it 'allows a plane to take off if the weather is not stormy' do
      weather = Weather.new("yes")
      expect { plane.take_off(weather.stormy) }.to raise_error "The weather is stormy"
    end
  end
end
