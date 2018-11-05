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
      it 'should not land if airport full' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect{ airport.land(plane) }.to raise_error 'the airport is full'
      end
    end
    context 'when stormy' do
      it 'should not land a plane' do
        allow(weather).to receive(:stormy?).and_return true
        airport = Airport.new(weather)
        expect{ airport.land(plane) }.to raise_error 'it is too stormy to land'
      end
    end
  end
  describe '#takeoff' do
    context 'when not stormy' do
      it 'should take off a plane' do
        allow(weather).to receive(:stormy?).and_return false
        airport = Airport.new(weather)
        airport.land(plane)
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
      airport = Airport.new
      new_cap = Airport::DEFAULT_CAPACITY + 1
      expect(airport.set_capacity(new_cap)).to eq new_cap
    end
  end
end
