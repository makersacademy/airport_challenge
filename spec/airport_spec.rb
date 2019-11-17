require 'airport'

describe Airport do
  subject(:airport) { described_class.new }
  let(:plane) { double :plane } # creating Doubles.

  context '#defaults' do
    it 'has a default capacity' do
      allow(airport).to receive(:stormy?).and_return(false)
      described_class::DEFAULT_CAPACITY.times { airport.to_land(plane) }
      expect { airport.to_land(plane) }.to raise_error "Airport is full: Take off some planes."
    end
  end

  describe '#to_land' do
    before do # checks if weather is sunny before doing any actions
      allow(airport).to receive(:stormy?).and_return(false)
    end
    it 'Instructs a plane to land.' do
      expect(airport).to respond_to(:to_land).with(1).argument # responds to 'to_land' method with '1' argument, in this case 'plane'.
    end 
    context 'Abort when' do
      it 'full airport' do # raise an error if airport is full (Default capacity - see airport.rb)
        airport.capacity.times { airport.to_land(plane) }
        expect { airport.to_land(plane) }.to raise_error "Airport is full: Take off some planes."
      end
      it 'storm' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.to_land(plane) }.to raise_error "Storm hapenning: Please try again later."
      end
    end
  end
  
  describe '#take_off' do
    before do # checks if weather is sunny before doing any actions
      allow(airport).to receive(:stormy?).and_return(false)
    end
    it 'Instructs a plane to take off' do
      expect(airport).to respond_to(:take_off) # responds to 'take_off' method. 
    end
    context 'Abort when' do
      it 'empty airport' do # raise an error to take off if there is 0 planes in the airport
        expect { airport.take_off }.to raise_error "Airport is empty: Insert a plane." 
      end
      it 'storm' do
        allow(airport).to receive(:stormy?).and_return(true)
        expect { airport.take_off }.to raise_error "Storm hapenning: Please try again later."
      end
    end
  end
    
  describe '#storm' do
    it 'may happen...' do
      allow(airport).to receive(:rand).and_return(8) # creating Stub.
      expect(airport.stormy?).to eq(true)
    end
  end
end
