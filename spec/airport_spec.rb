
require 'airport'


describe Airport do
  let(:plane) { Plane.new }

  describe '#land' do
    context 'When not stormy' do
        before do
            allow(subject).to receive(:stormy?).and_return false
        end

        it 'instructs a plane to land' do
            expect(subject).to respond_to(:land).with(1).argument
          end
        end
      
          it 'raises error if the airport is full' do
            allow(subject).to receive(:stormy?).and_return false
            11.times do
              subject.land(plane)
            end
            expect { subject.land(plane) }.to raise_error "Full to capacity: Landing Denied"   
          end
  end
   
    context 'when stormy' do
      it 'raises an error if asked to land a plane in a storm' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error "Denied permission to land due to storm"
        end
      end

         
    context 'when stormy' do
      it 'raises an error if asked to take_off a plane in a storm' do
       allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error "Denied permission to take off due to storm"
    end
  end
  

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end

  it 'Does method to check if plane in airport?' do
    plane = Plane.new
    subject.land(plane)
    subject.take_off(plane)
    expect(subject.in_air?(plane)).to eq(false)
  end

    it 'has a default capacity' do
       expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

end
