require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane)       { double(:plane, :start_flying => true, :end_flying => false) }

  context 'weather is good' do
    before do
      allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return false
    end

    it 'should instruct a plane to land and add to planes in airport' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'land(plane) should raise error when plane is already in airport' do
      airport.land(plane)
      expect { airport.land(plane) }.to raise_error described_class::ERROR[:already_in_airport]
    end

    it 'should instruct a plane to take off and remove from planes in airport' do
      airport.land(plane)
      expect(airport.planes).to include plane
      airport.take_off(plane)
      expect(airport.planes).not_to include plane
    end

    it 'land(plane) should raise error when plane is not in airport' do
      expect { airport.take_off(plane) }.to raise_error described_class::ERROR[:not_in_airport]
    end

    it 'should prevent land(plane) if airport full' do
      described_class::DEFAULT_CAPACITY.times do
        plane_unique = double(:plane, :start_flying => true, :end_flying => false)
        airport.land(plane_unique)
      end
      expect { airport.land(plane) } .to raise_error described_class::ERROR[:full]
    end
  end

  context 'stormy weather' do
    before do
      allow(airport.instance_variable_get(:@weather)).to receive(:stormy?).and_return true
    end

    it 'should raise error and prevent plane landing if stormy weather' do
      expect { airport.land(plane) }.to raise_error described_class::ERROR[:stormy]
    end

    it 'should raise error and prevent take_off(plane) if stormy weather' do
      expect { airport.take_off(plane) }.to raise_error described_class::ERROR[:stormy]
    end
  end

  it 'should have a default capacity that can be overridden' do
    expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
    airport.new_capacity(25)
    expect(airport.capacity).to eq 25
    airport = described_class.new(30)
    expect(airport.capacity).to eq 30
  end
end
