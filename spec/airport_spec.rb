require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane }
  let(:weather) { double :weather }

      before do
        allow(plane).to receive(:land)
        allow(plane).to receive(:take_off)
        allow(weather).to receive(:stormy?).and_return false
        airport.weather = weather
      end

  describe '#land' do
    before do
      allow(plane).to receive(:flying).and_return true
    end

    it 'allows the plane to land' do
      airport.land(plane)
    end

    it 'confirms the plane has landed' do
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

    it 'prevents landing in stormy weather' do
      allow(weather).to receive(:stormy?).and_return true
      message = "Plane cannot land in bad weather"
      expect { airport.land(plane) }.to raise_error message
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

      it 'prevents take off when weather is stormy' do
        allow(weather).to receive(:stormy?).and_return true
        message = "Plane can't take_off due to bad weather"
        expect{ airport.take_off(plane) }.to raise_error message
      end
    end

end