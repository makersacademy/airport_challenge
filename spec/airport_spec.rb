require 'airport'

describe Airport do
  subject(:heathrow) { described_class.new(described_class::DEFAULT_CAPACITY, weather) }
  let(:plane) { double :plane, land: nil, take_off: nil }
  let(:weather) { double :weather }

  describe "#land" do 
    context "when the weather is not stormy" do
      before do 
        allow(weather).to receive(:stormy?).and_return(false)
      end

      it 'instructs a plane to land' do
        # expect(heathrow).to respond_to(:land).with(1).argument
        expect(plane).to receive(:land)
        heathrow.land(plane)
      end

      context 'when the airport is full' do 
        it 'does not allow a plane to land by raising an error' do
          described_class::DEFAULT_CAPACITY.times { heathrow.land(plane) }
          expect { heathrow.land(plane) }.to raise_error('The airport is full.')
        end
      end
    end

    context 'when the weather is stormy' do 
      it 'does not allow a plane to land by raising an error' do
        allow(weather).to receive(:stormy?).and_return(true)
        expect { heathrow.land(plane) }.to raise_error('Cannot land - it is stormy.')
      end 
    end
  end
    
  describe "#take_off" do
    context 'when the weather is not stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return(false)
      end 

      it 'instructs a plane to take_off' do
        heathrow.land(plane)
        expect(plane).to receive(:take_off)
        heathrow.take_off(plane)
      end
      
      it 'returns a plane that takes off' do
        heathrow.land(plane)
        expect(heathrow.take_off(plane)).to eq(plane)
      end 

      it 'does not return planes that have taken off' do
        heathrow.land(plane)
        heathrow.take_off(plane)
        expect(heathrow.landed_planes).to_not include(plane)
      end

      it 'does not allow planes to take off from wrong airports' do
        gatwick = described_class.new(30, weather)
        gatwick.land(plane)
        expect { heathrow.take_off(plane) }.to raise_error('Cannot take off the plane - the plane is in another airport.')
      end 
    end

    context 'when the weather is stormy' do
      before do
        allow(weather).to receive(:stormy?).and_return(true)
      end

      it 'does not allow a plane to take off by raising an error' do
        expect { heathrow.take_off(plane) }.to raise_error('Cannot take off - it is stormy.')
      end 
    end 
  end

  describe '.initialize' do
    before(:each) { allow(weather).to receive(:stormy?).and_return(false) }

    it 'has a default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity' do
      random_number = Random.rand(10..100)
      expect { double(:heathrow, capacity: random_number) }.not_to raise_error
    end

  end 
end
