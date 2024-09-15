require 'airport'

describe Airport do 
  let(:airport) { Airport.new }
  let(:plane) { double :plane }

  describe '#land' do 
    it 'can instruct a plane to land' do 
      srand(100)
      allow(airport).to receive(:stormy?).and_return false 
      expect(airport.land(plane)).to eq [plane]
    end
    context 'when airport full' do
      it "has a maximum capacity of 5 " do 
        expect airport.capacity == Airport::DEFAULT_CAPACITY
      end
      it "it doesn't allow a plane to land" do 
        Airport::DEFAULT_CAPACITY.times { airport.land(plane) }
        expect { airport.land(plane) }.to raise_error 'Cannot land plane: Capacity is full'
      end
    end
  end

  describe '#takeoff' do
    it 'can instruct a plane to takeoff' do 
      srand(100)
      allow(airport).to receive(:stormy?).and_return false 
      airport.land(plane)
      airport.takeoff
      expect(airport.takeoff).to eq nil
    end
  end
end
