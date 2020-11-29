require 'airport'

describe Airport do
  let(:capacity) {5}
  let(:airport) {Airport.new(capacity)}
  let(:plane) {Plane.new}

  describe '#new' do
    it 'should instantiate an Airport object' do
      expect(Airport.new(capacity)).to be_instance_of Airport
    end
  end

  describe '#land' do
    it 'should return an instance of a Plane object' do
      expect(airport.land(plane)).to eq plane
    end

    it 'should prevent landing when the airport is full' do
      capacity.times {airport.land(plane)}
      expect {airport.land(plane)}.to raise_error("Airport Full")
    end
  end

  describe '#takeoff' do
    it 'should return a confirmation message of plane departure' do
      expect(airport.takeoff(plane)).to eq "#{plane} has departed"
    end
  end

  describe '#full?' do
    it 'should return true if the airport is full' do
      capacity.times {airport.land(plane)}
      expect(airport.full?).to eq true
    end
  end

  describe '#full?' do
    it 'should return false if the airport is not full' do
      expect(airport.full?).to eq false
    end
  end

  describe '#capacity' do
    it 'should return the value of the aiport capacity' do
      expect(airport.capacity).to eq capacity
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
