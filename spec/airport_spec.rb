require 'airport'
require 'weather'
require 'plane'

describe Airport do
  let(:weather) { double :weather }
  let(:plane) { double :plane }
  describe '#land' do
    context 'when not stormy' do
      it 'should land a plane' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        expect(airport.land(plane)).to include plane
      end
    end
    context 'when stormy' do
      it 'should not land a plane' do
        allow(weather).to receive(:stormy?).and_return true
        airport = Airport.new(weather)
        expect{ airport.land(plane) }.to raise_error 'it is too stormy to land'
      end
    end
    it 'should not land if airport full' do
      allow(weather).to receive(:stormy?).and_return false
      airport = Airport.new(weather)
      10.times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error 'the airport is full'
    end
  end
  describe '#takeoff' do
    context 'when not stormy' do
      it 'should take off a plane' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        expect(airport.takeoff(plane)).to eq "#{plane} has taken off"
      end
    end
    context 'when stormy' do
      it 'should prevent take off' do
        allow(weather).to receive(:stormy?).and_return true
        airport = Airport.new(weather)
        expect{ airport.takeoff(plane) }.to raise_error 'it is too stormy to take off'
      end
    end
  end
  describe '#set_capacity' do
    it 'should accept a new capacity' do
      allow(weather).to receive(:stormy?).and_return false
      airport = Airport.new(weather)
      airport.set_capacity(5)
      5.times { airport.land(plane) }
      expect{ airport.land(plane) }.to raise_error 'the airport is full'
    end
  end
end
