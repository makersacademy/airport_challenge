require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

  before do
    allow(airport.weather).to receive(:stormy?).and_return false
  end

  describe '#initialize' do
    it 'should take an argment for variable capacity' do
      expect(Airport).to respond_to(:new).with(1).argument
    end

    it 'should pass the argument and set capacity' do
      argument = 5
      airport = Airport.new(argument)
      expect(airport.capacity).to eq argument
    end
  end

  describe '#land' do
    before do
      allow(plane).to receive(:lands)
      allow(plane).to receive(:status).and_return :flying
    end

    it 'can land more than one plane' do
      expect { 2.times { airport.land plane } }.to_not raise_error
    end

    it 'cannot land in stormy weather' do
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.land plane }.to raise_error 'Could not complete landing due to weather'
    end

    context 'plane status is :parked' do
      it 'means plane cannot land ' do
        allow(plane).to receive(:status).and_return :parked
        expect { airport.land plane }.to raise_error 'This plane is not flying'
      end
    end
  end

  describe '#planes' do
    context 'when planes land' do
      it 'should show all the planes' do
        allow(plane).to receive(:lands)
        allow(plane).to receive(:status).and_return :flying
        plane2 = double(:plane2)
        allow(plane2).to receive(:lands)
        allow(plane2).to receive(:status).and_return :flying
        airport.land plane
        airport.land plane2
        expect(airport.planes).to eq [plane, plane2]
      end
    end
  end

  describe '#take_off' do
    before do
      allow(plane).to receive(:lands)
      allow(plane).to receive(:takes_off)
      allow(plane).to receive(:status).and_return :flying
    end

    it 'raises an exception when the plane is not in airport' do
      plane2 = double(:plane2)
      allow(plane2).to receive(:lands)
      allow(plane2).to receive(:takes_off)
      allow(plane2).to receive(:status).and_return :flying
      airport.land plane2
      allow(plane).to receive(:status).and_return :parked
      expect { airport.take_off plane }.to raise_error 'Plane not in airport'
    end

    it 'allows a plane to take off' do
      airport.land plane
      allow(plane).to receive(:status).and_return :parked
      expect(airport.take_off plane).to eq plane
    end

    it 'cannot takeoff in stormy weather' do
      airport.land plane
      allow(plane).to receive(:status).and_return :parked
      allow(airport.weather).to receive(:stormy?).and_return true
      expect { airport.take_off plane }.to raise_error 'Could not complete takeoff due to weather'
    end

    context 'plane status is :flying' do
      it 'means plane cannot takeoff' do
        allow(plane).to receive(:status).and_return :flying
        expect { airport.take_off plane }.to raise_error 'This plane is already flying'
      end
    end
  end
end
