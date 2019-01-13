require 'airport'

RSpec.describe Airport do

  let(:plane) { double :plane }

  it 'instructs a plane to land' do
    is_expected.to respond_to(:land).with(1).argument
  end
  
  it 'instructs a plane to take off' do
    is_expected.to respond_to(:take_off).with(1).argument
  end
  
  it 'instructs to see planes' do
    is_expected.to respond_to(:planes)
  end
  
  describe '#land' do
    context 'when stormy' do
      before do
        allow(Weather).to receive(:current).and_return('stormy')
      end
  
      it 'prevents landing' do
        message = 'Cannot Land: Turbulent Weather'
        expect { subject.land(plane) }.to raise_error(message)
      end
    end

    context 'when not stormy' do
      before do
        allow(Weather).to receive(:current).and_return('clear')
      end
  
      it 'confirms plane landed' do
        subject.land(plane)
        expect(subject.planes).to include plane
      end
    
      it 'prevents landing when full' do
        subject.land(plane)
        message = 'Cannot Land: Airport Full' 
        expect { subject.land(plane) }.to raise_error(message)
      end

      it 'can land multiple planes' do
        subject.capacity = 5
        subject.capacity.times { subject.land(Plane.new) }
        expect(subject.planes.length).to eq 5
      end
    end

  end
  
  describe '#take_off' do
    context 'when stormy' do
      before do
        allow(Weather).to receive(:current).and_return('clear')
        subject.land(plane)
        allow(Weather).to receive(:current).and_return('stormy')
      end
      
      it 'prevents take off' do
        message = 'Cannot Take Off: Turbulent Weather'
        expect { subject.take_off(plane) }.to raise_error(message)
      end
    end
    
    context 'when not stormy' do
      let(:plane_1) { double :plane_1 }
      let(:plane_2) { double :plane_2 }
      let(:plane_3) { double :plane_3 }

      before do
        allow(Weather).to receive(:current).and_return('clear')
        subject.land(plane)
      end
      
      it 'prevents take off if not at airport' do
        message = "Cannot Take Off: Plane Not Found"
        expect { subject.take_off(Plane.new) }.to raise_error(message)
      end

      it 'confirms plane took off' do
        subject.take_off(plane)
        expect(subject.planes).to_not include plane
      end

      it 'can take off multiple planes' do
        subject.capacity = 4
        
        subject.land(plane_1)
        subject.land(plane_2)
        subject.land(plane_3)
        
        subject.take_off(plane)
        subject.take_off(plane_1)
        subject.take_off(plane_2)
        subject.take_off(plane_3)
        
        expect(subject.planes).to be_empty
      end
    end
  end
  
  describe '#capacity' do
    it 'has a default capacity of 1' do
      expect(subject.capacity).to eq 1
    end
  
    it 'can change capacity' do
      subject.capacity = 5
      expect(subject.capacity).to eq 5
    end
  end
end
