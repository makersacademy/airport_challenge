require 'plane'

describe Plane do
  describe '#land' do
    it { expect(subject).to respond_to(:land).with(1).argument }
    it 'should land at an airport' do
      airport = Airport.new
      expect(subject.land(airport)).to eq "The plane has landed at #{airport}"
    end
  end
  describe '#take_off' do
    it 'should take off from an airport' do
      airport = Airport.new
      subject.land(airport)
      expect(subject.take_off).to eq "The plane has taken off from #{airport}"
    end
  end
  describe '#location' do
    it 'should return current plane location' do
      expect(subject.location).to eq "In flight"
      airport = Airport.new
      subject.land(airport)
      expect(subject.location).to eq airport
    end
  end
end
