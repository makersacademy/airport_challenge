require 'airport'
require 'weather'
require 'plane'

describe Airport do

  subject(:airport) {Airport.new}
  subject(:plane) {Plane.new}

  describe '#clear' do

    context 'not clear to take off' do
      it 'checks the weather' do
        #stub rand method so weather is stormy
        allow(airport.weather).to receive(:rand).with(0..9) {9}
        expect(airport.clear?).to be_falsy
      end
    end
    context 'clear to take off' do
      it 'checks the weather' do
        #stub rand method so weather is stormy
        allow(airport.weather).to receive(:rand).with(0..9) {3}
        expect(airport.clear?).to be_truthy
      end
    end

  end

  describe '#planes' do
  
    it 'stores a landed plane in the hangar' do
      allow(airport.weather).to receive(:rand).with(0..9) {3}
      plane.land_at(airport)
      expect(airport.planes[0]).to eq plane
    end
    it 'has a default capacity of 10' do
      expect(Airport::DEFAULT_CAPACITY).to eq 10
    end
    it 'allows to override default capacity' do
      expect(Airport.new(15).capacity).to eq 15
    end
  
  end

  describe '#full?' do

    it 'returns true if capacity is reached' do
      allow(airport.weather).to receive(:rand).with(0..9) {3}
      airport.capacity.times { Plane.new.land_at(airport) }
      expect(airport).to be_full
    end

  end

end