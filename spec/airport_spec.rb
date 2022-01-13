require 'airport'

describe Airport do
  subject(:airport) { described_class.new(20, weather_reporter) }
  let(:plane) { double :plane }
  let(:weather_reporter) { double :weather_reporter }

  

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end

      it 'instructs a plane to take off' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end

      it 'raises an error if plane is not at this airport' do
        another_airport = described_class.new(20, weather_reporter)
        another_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error 'plane not at this airport'
      end
    end

    context 'when stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return true
      end

      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'weather is stormy'
      end
    end
  end

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end

      it 'tells a plane to land' do
        expect(airport).to respond_to(:land).with(1).argument
      end

      context 'when full' do
        it 'raises an error' do
          20.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'airport full'
        end
      end
    end
    
    context 'when stormy' do
      it 'raises an error' do
        allow(weather_reporter).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'weather is stormy'
      end
    end
  end


end