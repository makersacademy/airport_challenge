require 'airport'
require 'plane'

describe Airport do
  describe '#new' do
    it 'returns a new airport object' do
      expect(subject).to be_an_instance_of(Airport)
    end

    it 'is expected to overwrite airport defafault capacity to 20' do
      expect(subject.capacity = 20).to eq 20
    end
  end

  describe '#stormy' do
    context 'respond to stormy?' do
      it { is_expected.to respond_to(:stormy?) }
    end
  end

  describe '#land' do
    context 'responds to the land method' do
      it { is_expected.to respond_to(:land) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:land).with(1).argument }
    end

    context 'when the weather is stormy?' do
      it 'prevents landing' do
        plane = Plane.new('LGT 567')
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error 
      end
    end

    context 'if the airport is full' do
      it 'raise an exception' do
        plane = Plane.new('BRITISH AIRWAYS')
        10.times do
          subject.land(plane)
        end
        expect { subject.land(plane) }.to raise_error
      end
    end
  end

  describe '#take_off' do
    context 'responds to take_off' do
      it { is_expected.to respond_to(:take_off) }
    end

    context 'responds to one argument' do
      it { is_expected.to respond_to(:take_off).with(1).argument }
    end

    it 'takes off and it confirms that there are 0 planes left in the airport' do
      plane = Plane.new('RYANAIR 77')
      expect(subject.take_off(plane)).to eq nil
    end

    context 'when the weather is stormy?' do
      it 'prevents to takeoff' do
        plane = Plane.new('FGH 654')
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error
      end
    end
  end
end
