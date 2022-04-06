require 'airport'

describe Airport do
  subject(:airport) { described_class.new(40, weather_reporter) }
  let(:plane) { double :plane }
  let(:weather_reporter) { double :weather_reporter }

  describe '#land' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to land 🛬' do
        expect(airport).to respond_to(:land).with(1).argument
      end
  
      context 'when the airport is full' do
        it 'raises an error' do
          40.times do
            airport.land(plane)
          end
          expect { airport.land(plane) }.to raise_error 'Unable to land plane: no empty spaces.'
        end
      end  
    end
    
    context 'when stormy' do
      it 'raises an error' do
        allow(weather_reporter).to receive(:stormy?).and_return true
        expect { airport.land(plane) }.to raise_error 'Unable to land plane: stormy weather.'
      end
    end
   

  end

  describe '#take_off' do
    context 'when not stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return false
      end
      it 'instructs a plane to take off 🛫 and confirms that it is no longer in the airport' do
        expect(airport).to respond_to(:take_off).with(1).argument
      end
      
      it 'raises an error if plane is not at this airport' do
        another_airport = described_class.new(40, weather_reporter)
        another_airport.land(plane)
        expect { airport.take_off(plane) }.to raise_error 'Cannot take off: plane is not at this airport'

      end
    end
    
    context 'when stormy' do
      before do
        allow(weather_reporter).to receive(:stormy?).and_return true
      end
      it 'raises an error' do
        expect { airport.take_off(plane) }.to raise_error 'Unable to allow planes to take off: stormy weather.'
      end


    end
  end

end
