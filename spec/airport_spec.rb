require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  DEFAULT_CAPACITY = 1
  
  describe '#land' do

    it 'lands a plane' do
      allow(airport).to receive(:stormy?).and_return false
      expect(airport).to respond_to(:land).with(1).argument
    end

    it 'raises an error when the airport is full' do
      allow(airport).to receive(:stormy?).and_return false
      DEFAULT_CAPACITY.times { airport.land Airport.new }
      expect { airport.land airport }.to raise_error "This airport is full"
    end

    it 'raises a weather error when trying to land a plane' do
      allow(airport).to receive(:stormy?).and_return true
      expect{ airport.land(plane)}.to raise_error "Plane can't land due to stormy weather"
    end

  end

  describe '#take_off' do

    it 'instructs a plane to take off and confirm they have taken off' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end

    it 'raises a weather error when tying to take off' do
      allow(airport).to receive(:stormy?).and_return true
      expect{ airport.take_off(plane)}.to raise_error "Plane can't take off due to stormy weather"
    end

  end

end