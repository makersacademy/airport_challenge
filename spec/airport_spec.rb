require "airport"

describe Airport do
  subject(:heathrow) { described_class.new described_class::DEFAULT_CAPACITY }
  let(:plane) {Plane.new}

  describe "#land" do 
    context "when the weather is not stormy" do
      before do 
        allow(heathrow).to receive(:stormy?).and_return(false)
      end

      it 'instructs a plane to land' do
        expect(heathrow).to respond_to(:land).with(1).argument
      end

      context 'when the airport is full' do 
        it 'does not allow a plane to land by raising an error' do
          Airport::DEFAULT_CAPACITY.times { heathrow.land(plane) }
          expect { heathrow.land(plane) }.to raise_error('The airport is full.')
        end
      end
    end

    context 'when the weather is stormy' do 
      it 'does not allow a plane to land by raising an error' do
        allow(heathrow).to receive(:stormy?).and_return(true)
        expect { heathrow.land(plane) }.to raise_error('Cannot land - it is stormy.')
      end 
    end
  end
    
  describe "#take_off" do
    context 'when the weather is not stormy' do
      before do
        allow(heathrow).to receive(:stormy?).and_return(false)
      end 

      it 'instructs a plane to take_off' do
        expect(heathrow).to respond_to(:take_off).with(1).argument
      end
    end

    context 'when the weather is stormy' do
      before do
        allow(heathrow).to receive(:stormy?).and_return(true)
      end
      
      it 'does not allow a plane to take off by raising an error' do
        expect { heathrow.take_off(plane) }.to raise_error('Cannot take off - it is stormy.')
      end 
    end 
  end
end
