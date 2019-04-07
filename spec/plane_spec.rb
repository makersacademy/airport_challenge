require 'plane'

describe Plane do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'lands at an airport' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      expect(subject.land(airport)).to eq airport
    end
    it 'raises an error if the airport does not exist' do
      airport = "Imaginary"
      expect { subject.land(airport) }.to raise_error("Airport does not exist")
    end
    it 'raises an error if the plane is not in flight' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect { subject.land(airport) }.to raise_error("Plane not in flight")
    end
    it 'prevents landing if weather is stormy' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { true }
      expect { subject.land(airport) }.to raise_error("Weather is stormy, landing not allowed")
    end
  end
  describe '#take_off' do
    it 'takes off from an airport' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(subject.take_off).to eq nil
    end
    it 'raises an error if the plane is not at an airport' do
      expect { subject.take_off }.to raise_error("Plane not at an airport")
    end
    it 'prevents take off if weather is stormy' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      allow(airport).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error("Weather is stormy, take off not allowed")
    end
  end
  describe '#in_airport?' do
    it 'initially is false' do
      expect(subject).not_to be_in_airport
    end
    it 'returns true when plane has landed' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      expect(subject).to be_in_airport
    end
    it 'returns false after plane has landed and taken off' do
      airport = Airport.new
      allow(airport).to receive(:stormy?) { false }
      subject.land(airport)
      subject.take_off
      expect(subject).not_to be_in_airport
    end
  end
end
