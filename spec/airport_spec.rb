require 'airport.rb'

describe Airport do
  let(:plane) { double :plane, land: nil, landed?: nil }
  subject(:airport) { described_class.new }

  describe 'initialization' do
    it 'initializes with a default capacity' do
      expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      airport = Airport.new(100)
      expect(airport.capacity).to eq 100
    end
  end

  describe '#clear_to_land' do
    context 'when not stormy' do
      before do
        allow(airport).to receive(:stormy?) { false }
      end

      it 'instructs a plane to land at the airport' do
        expect(airport.clear_to_land(plane)).to include plane
      end

      it 'prevents a plane from landing if it is already at the airport' do
        allow(plane).to receive(:landed?) { true }
        msg = 'The plane has already landed at the airport'
        expect{airport.clear_to_land(plane)}.to raise_error msg
      end

      it 'prevents landing whent he airport is full' do
        allow(airport).to receive(:full?) { true }
        msg = 'The airport is full'
        expect{airport.clear_to_land(plane)}.to raise_error msg
      end
    end

    context 'when stormy'do
      it 'landing is prevented when weather is stormy' do
        allow(airport).to receive(:stormy?) { true }
        msg = 'Stormy weather is preventing landing'
        expect{airport.clear_to_land(plane)}.to raise_error msg
      end
    end
  end

  describe '#landed_planes' do
    it 'keeps track of planes that have landed at the airport' do
      allow(airport).to receive(:stormy?) { false }
      airport.clear_to_land(plane)
      expect(airport.landed_planes).to include(plane)
    end
  end

  describe '#clear_to_takeoff' do
    it 'instructs a plane to takeoff and removes it from the landed planes array' do
      allow(airport).to receive(:stormy?) { false }
      allow(plane).to receive(:takeoff)
      airport.clear_to_land(plane)
      airport.clear_to_takeoff
      expect(airport.landed_planes).not_to include plane
    end

    it 'prevents takeoff if weather is stormy' do
      allow(airport).to receive(:stormy?) { true }
      allow(airport).to receive(:empty?) { false }
      msg = 'Stormy weather is preventing takeoff'
      expect{airport.clear_to_takeoff}.to raise_error msg
    end

    it 'raises an error if there are no planes to takeoff' do
      msg = 'There are no planes at the airport'
      expect{airport.clear_to_takeoff}.to raise_error msg
    end

  end

  describe '#confirm_landed' do
    it 'accepts a plane and confirms if it has landed' do
      allow(plane).to receive(:landed?) {true}
      expect(airport.confirm_landed(plane)).to eq true
    end
  end
end
