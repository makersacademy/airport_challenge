require 'airport'
require 'plane'
require 'weather'

describe Airport do
  subject(:airport) { described_class.new }
  subject(:plane) { described_class.new }
  describe '#land' do
    it 'should not allow landing when weather is stormy' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land(plane) }.to raise_error 'Landing cancelled due to bad weather'
    end
    it 'should land a plane when weather is sunny' do
      allow(airport.weather).to receive(:stormy?).and_return false
      expect(airport.land(plane)).to eq [plane]
    end
  end
  describe '#take_off' do
    it 'should not allow take off when weather is stormy' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.take_off(plane) }.to raise_error 'Take off cancelled due to bad weather'
    end
    it 'should take off the plane when weather is sunny and confirm its gone' do
      allow(airport.weather).to receive(:stormy?).and_return false
      airport.land(plane)
      airport.take_off(plane)
      expect(airport.status).to eq "0 plane at the airport"
    end
  end
end
