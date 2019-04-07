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
  describe '#in_airport?' do
    it 'should initialize as false' do
      expect(subject.in_airport?).to eq false
    end
    it 'should return true when plane has landed' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.in_airport?).to eq true
    end
    it 'should return false after plane has landed and taken off' do
      airport = Airport.new
      subject.land(airport)
      subject.take_off
      expect(subject.in_airport?).to eq false
    end
  end
end
