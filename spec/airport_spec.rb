require 'airport'

describe Airport do
subject { described_class.new(20) }
  let(:plane) { double(:plane) }

    describe'#land' do
      context 'when not stormy' do
        it 'instructs a plane to land' do
          allow(subject).to receive(:stormy?).and_return false
          expect(subject).to respond_to(:land).with(1).argument
        end

        context 'when airport is full' do 
          it 'raises an error' do
            allow(subject).to receive(:stormy?).and_return false
            20.times { subject.land(plane) }
            expect { subject.land(plane) }.to raise_error "Cannot land plane as airport is full"
          end
        end
      end

    context 'when stormy'  do
      it 'raises an error when stormy' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error "Cannot land plane as it is stormy"
      end
    end
  end

  describe '#plane' do
      it 'confirms what planes are in an airport' do
        expect(subject.plane).to eq(@planes)
      end
    end

  describe '#take_off' do
    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end
  end


end
