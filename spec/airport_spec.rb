require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do

  describe '#land_plane and #takeoff' do
    it 'allows planes to land' do
      expect(subject).to respond_to :land_plane
    end

    it { is_expected.to respond_to(:take_off).with(1).argument }

  end

  describe '#weather' do
    it 'can land if it is not stormy' do
      expect(subject.weather).to respond_to(:stormy) { false }
    end
    it 'cannot land if it is stormy' do
      expect(subject.weather).to respond_to(:stormy) { true }
    end
  end
end
