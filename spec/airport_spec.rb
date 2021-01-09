require 'airport'

describe Airport do

  subject(:airport) { Airport.new(20, weather_forecast) }
  let(:plane) { double :plane }
  let(:weather_forecast) { double :weather_forecast}


  describe '#land' do
    context 'when not stormy' do
      before do 
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'instruct the plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'is full' do
        it 'raises error' do
          20.times { airport.land(plane) }
          expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
        end
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises error' do
        expect { airport.land(plane) }.to raise_error "Cannot land plane - stormy weather"
      end
    end
  end

  describe '#take_off' do
    context 'when not stormy' do
      before do 
        allow(weather_forecast).to receive(:stormy?).and_return false
      end
      it 'instruct the plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
    end

    context 'when stormy' do
      before do
        allow(weather_forecast).to receive(:stormy?).and_return true
      end
      it 'raises error' do
        expect { airport.take_off(plane) }.to raise_error "Cannot take off plane - stormy weather"
      end
    end
  end
end