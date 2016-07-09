require 'airport'
require 'weather'
require 'plane'

describe Airport do

  it { is_expected.to respond_to :capacity }

  describe '#capacity' do

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'allows user to set @capacity' do
      airport = Airport.new 10
      expect(airport.capacity).to eq(10)
    end

  end

  describe '#full?' do

    it 'returns true if the airport is full' do
      airport = Airport.new 1
      weather = Weather.new
      plane1 = Plane.new
      allow(weather).to receive(:stormy?) { false }
      plane1.land(airport, weather)
      expect(airport.full?).to eq true
    end

  end

end
