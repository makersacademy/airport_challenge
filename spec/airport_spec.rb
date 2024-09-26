require 'airport'
require 'plane'

describe Airport do 

  subject(:airport) { described_class.new }
  let(:plane) { Plane.new }

  describe '#land' do

    it 'instructs a plane to land' do 
      allow(airport).to receive(:stormy?).and_return(false)
      expect(airport).to respond_to(:land).with(1).argument 
    end 
    
    context 'when the airport is full' do
      it 'does not allow planes to land' do
        allow(airport).to receive(:stormy?).and_return(false)
        10.times do 
        airport.land(plane)
        end
      expect { airport.land(plane) }.to raise_error 'Cannot land the plane, the airport is full'
      end
  end


  describe '#take_off' do 

    it 'instruct a plane to take off from an airport and confirm this' do
      expect(airport).to respond_to(:take_off).with(1).argument
    end 

    it 'has default capacity which can be changed as appopriate' do 
      capacity = 10
      expect(airport.capacity).to eq(10)
    end 

    context 'when the weather is stormy' do 
      before do 
      allow(airport).to receive(:stormy?).and_return(true)
      # add expection block
      end
    end
  end
end 
end
