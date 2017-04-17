require 'plane'
require 'airport'

describe Plane do

  describe '#land' do
    it 'lands a plane' do
      airport = Airport.new

      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(subject.land(airport)).to include(subject)
    end

    it 'marks the plane as parked' do
      airport = Airport.new
      allow(airport.weather).to receive(:stormy?).and_return(false)

      expect(airport).to receive(:park).with(subject)
      subject.land(airport)
    end

    context 'when the weather is stormy' do
      it 'returns an error message' do
        airport = Airport.new
        allow(airport.weather).to receive(:stormy?).and_return(true)

        message = 'Due to stormy weather, the plane cannot land'
        expect { subject.land(airport) }.to raise_error message
      end
    end

    context 'when the airport is full' do
      it 'returns an error message' do
        airport = Airport.new
        allow(airport).to receive(:full?).and_return(true)
        allow(airport.weather).to receive(:stormy?).and_return(false)

        message = 'This airport is full, the plane cannot land'
        expect { subject.land(airport) }.to raise_error message
      end
    end
  end

  describe '#take_off' do
    let(:airport) { Airport.new }

    before do
      airport.park(subject)
    end

    it 'returns the plane' do
      allow(airport.weather).to receive(:stormy?).and_return(false)
      expect(subject.take_off(airport)).to eq subject
    end

    it 'marks the plane as en route' do
      allow(airport.weather).to receive(:stormy?).and_return(false)

      expect(airport).to receive(:en_route).with(subject)
      subject.take_off(airport)
    end

    context "when the plane is not parked" do
      it 'raises an error' do
        airport = Airport.new
        allow(airport.weather).to receive(:stormy?).and_return(false)
        expect { subject.take_off(airport) }.to raise_error 'A plane needs to be parked first before it can take off'
      end
    end

    context 'when the weather is stormy' do
      it 'cannot take off and returns an error message' do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        message = 'Due to stormy weather, the plane cannot take off'
        expect { subject.take_off(airport) }.to raise_error message
      end

      it 'remains parked' do
        allow(airport.weather).to receive(:stormy?).and_return(true)
        message = 'Due to stormy weather, the plane cannot take off'
        expect { subject.take_off(airport) }.to raise_error message
      end
    end
  end
end
