require 'plane'

describe Plane do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'should land at an airport' do
      airport = Airport.new
      expect(subject.land(airport)).to eq airport
    end
    it 'raises an error if the airport does not exist' do
      airport = "Imaginary"
      expect { subject.land(airport) }.to raise_error("Airport does not exist")
    end
    it 'raises an error if the plane is not in flight' do
      airport = Airport.new
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Plane not in flight")
    end
  end
  describe '#take_off' do
    it 'should take off from an airport' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.take_off).to eq nil
    end
    it 'raises an error if the plane is not at an airport' do
      expect { subject.take_off }.to raise_error("Plane not at an airport")
    end
  end
  describe '#location' do
    it 'should return current plane location' do
      expect(subject.location).to eq "In flight"
    end
    it 'should return the airport it last landed at' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.location).to eq airport
    end
    it 'should no longer be in the airport after landing and taking off' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off
      expect(subject.location).to eq nil
    end
  end
end
