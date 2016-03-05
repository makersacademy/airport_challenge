require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }

      before do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
      end

  describe '#land' do
    before do
      allow(plane).to receive(:flying).and_return(true)
    end

    it 'allows the plane to land' do
      airport.land(plane)
    end

    it 'confirms the plane has landed' do
      airport.land(plane)
      expect(airport.planes).to include plane
    end

    it 'prevents the plane from landing when airport is full' do
      3.times { airport.land(plane) }
      message = 'No space for landing'
      expect { airport.land(plane) }.to raise_error message
    end

    it 'prevents a parked plane from landing' do
      airport.land(plane)
      allow(plane).to receive(:flying).and_return(false)
      airport.land(plane)
      expect(airport.land(plane)).to eq "Not an airborne plane."
    end
  end

    describe '#take_off' do
      before do
        allow(plane).to receive(:flying).and_return(true)
      end

      it 'confirms the plane has left the airport' do
        airport.land(plane)
        airport.take_off(plane)
        expect(airport.planes).to eq []
      end

      it 'prevents a flying plane to take_off' do
        airport.take_off(plane)
        expect(airport.take_off(plane)).to eq "Plane not in airport"
      end
    end

end