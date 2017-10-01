require 'airport'
require 'weather'
require 'plane'

describe Airport do

  subject(:airport) {Airport.new}
  subject(:plane) {Plane.new}

  describe '#clear' do

    context 'not cleared to take off' do
      it 'checks the weather' do
        #stub rand method so weather is stormy
        allow(airport.weather).to receive(:rand).with(0..9) {9}
        expect(airport.clear?).to be_falsy
      end
    end
    context 'cleared to take off' do
      it 'checks the weather' do
        #stub rand method so weather is stormy
        allow(airport.weather).to receive(:rand).with(0..9) {0}
        expect(airport.clear?).to be_truthy
      end
    end

  end

  describe '#planes' do
  
    it 'has a default capacity of 10' do
      expect(Airport::DEFAULT_CAPACITY).to eq 10
    end
    it 'allows to override default capacity' do
      expect(Airport.new(15).capacity).to eq 15
    end
  
  end

  describe '#full?' do

    context 'full' do
      it 'returns true if capacity is reached' do
        allow(airport.weather).to receive(:rand).with(0..9) {0}
        airport.capacity.times { Plane.new.land_at(airport) }
        expect(airport).to be_full
      end
    end
    context 'empty' do
      it 'returns false if not full' do
        allow(airport.weather).to receive(:rand).with(0..9) {3}
        plane.land_at(airport)
        expect(airport).to_not be_full
      end
    end

  end

  describe '#land' do

    it 'instructs a plane to land at the airport' do
      expect(airport.land(plane)).to include(plane)
    end
    it 'stores a landed plane in the hangar' do
      allow(airport.weather).to receive(:rand).with(0..9) {0}
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    # it 'raises error if weather is stormy' do
    #   allow(airport).to receive(:clear?) {false}
    #   expect {plane.land_at(airport)}.to raise_error 'cannot land in stormy weather'
    # end
    it 'raises error if trying to land at a full airport' do
      allow(airport).to receive(:full?) {true}
      expect {airport.land(plane)}.to raise_error 'cannot land at full airport'
    end 
    # it 'raises error if already landed' do
    #   plane.land_at(airport)
    #   expect {plane.land_at(airport)}.to raise_error 'plane has already landed'
    # end

  end

  describe '#take off' do
    it 'instructs a plane to take off from the airport' do
      expect(airport.take_off(plane)).to eq nil
    end
    it 'confirms a plane has left the airport' do
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.planes).to_not include(plane)
    end
    it 'allows a plane to land again once taken off' do
      airport.land(plane)
      airport.take_off(plane)
      airport.land(plane)
      expect(airport.planes).to include(plane)
    end
    # it 'raises error if weather is stormy' do
    #   allow(airport).to receive(:clear?) {false}
    #   expect {plane.take_off_from(airport)}.to raise_error 'cannot take off in stormy weather'
    # end
    # it 'raises error if already in the air and attempting to take off' do
    #   plane.take_off_from(airport)
    #   expect {plane.take_off_from(airport)}.to raise_error 'plane is already in the air'
    # end
    # it 'raises error if in a different airport' do
    #   expect {plane.take_off_from(Airport.new)}.to raise_error 'plane is not at this airport'
    # end
  end

end