require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  # let(:weather) { double :weather }

    before do
      allow(plane).to receive(:land)
      allow(plane).to receive(:take_off)
      allow(airport).to receive(:stormy?).and_return false
    end

    it 'has a variable capacity' do
      large_airport = described_class.new(50)
      expect(large_airport.capacity).to eq 50
    end

  context 'in stormy weather' do
    before do
      allow(airport).to receive(:stormy?).and_return true
    end

    it 'prevents landing' do
      message = "Plane cannot land in bad weather"
      expect { airport.land(plane) }.to raise_error message
    end

    it 'prevents take off' do
      message = "Plane cannot take off in bad weather"
      expect{ airport.take_off(plane) }.to raise_error message
    end
  end

  describe '#land' do
    before do
      allow(plane).to receive(:flying).and_return true
    end

    it 'lands the plane and confirms the plane has landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'prevents the plane from landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
      message = 'No space for landing'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'prevents a parked plane from landing' do
      airport.land(plane)
      allow(plane).to receive(:flying).and_return false
      airport.land(plane)
      expect(airport.land(plane)).to eq "Not an airborne plane."
    end


  end

    describe '#take_off' do
      before do
        allow(plane).to receive(:flying).and_return true
      end

      it 'confirms the plane has left the airport' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).to eq []
      end

      it 'prevents a flying plane to take off' do
        airport.take_off(plane)
        expect(airport.take_off(plane)).to eq "Plane not in airport"
      end
    end

end