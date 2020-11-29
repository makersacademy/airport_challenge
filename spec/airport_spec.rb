require 'airport'

describe Airport do
  let(:capacity) { 5 }
  let(:airport) { Airport.new(capacity) }
  let(:plane) { Plane.new }

  describe '#new' do
    it 'should instantiate an Airport object with a given capacity argument' do
      expect(Airport.new(capacity)).to be_instance_of Airport
    end
  end

  describe '#land' do
    it 'should return an instance of a Plane object' do
      allow(airport).to receive(:stormy?) { false }
      expect(airport.land(plane)).to eq plane
    end

    it 'should prevent landing when the airport is full' do
      allow(airport).to receive(:stormy?) { false }
      capacity.times { airport.land(Plane.new) }
      expect { airport.land(plane) }.to raise_error("Airport Full")
    end

    it 'should prevent landing if weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      expect { airport.land(plane) }.to raise_error "No landing, stormy weather"
    end

    it 'should prevent landing if plane is already in airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error "Plane already in airport"
    end
  end

  describe '#takeoff' do
    it 'should return a remove plane from airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.takeoff(plane)).to eq plane
    end

    it 'should prevent takeoff if weather is stormy' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff(plane) }.to raise_error "No takeoff, stormy weather"
    end

    it 'should prevent takeoff if plane is not in airport' do
      expect { airport.takeoff(Plane.new) }.to raise_error "Plane not in airport"
    end
  end

  describe '#confirm_departure' do
    it 'predicate should confirm plane no longer in airport after takeoff' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      airport.takeoff(plane)
      expect(airport.confirm_departure(plane)).to eq "Plane not in Airport"
    end
  end

  describe '#in_airport?' do
    it 'predicate should return true if plane is in airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.land(plane)
      expect(airport.in_airport?(plane)).to eq true
    end
  end

  describe '#full?' do
    it 'predicate should return true if the airport is full, and' do
      allow(airport).to receive(:stormy?) { false }
      capacity.times { airport.land(Plane.new) }
      expect(airport.full?).to eq true
    end

    it 'should return false if the airport is not full' do
      expect(airport.full?).to eq false
    end
  end

  describe '#capacity' do
    it 'should return the value of the aiport capacity' do
      expect(airport.capacity).to eq capacity
    end
  end

  describe '#chance' do
    it 'should return a random number between 0 and 10' do
      expect(airport.chance).to be_between(0, 10)
    end
  end

  describe '#stormy?' do
    it 'predicate should return true when the airport is stormy, and' do
      allow(airport).to receive(:chance) { 2 }
      expect(airport.stormy?).to eq true
    end

    it 'should return false when the airport is not stormy' do
      allow(airport).to receive(:chance) { 8 }
      expect(airport.stormy?).to eq false
    end
  end
end

describe Plane do
  describe '#new' do
    it 'should instantiate a Plane object' do
      expect(Plane.new).to be_instance_of Plane
    end
  end
end
