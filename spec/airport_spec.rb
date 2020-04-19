require 'airport'
# require 'plane'

describe Airport do
  subject { described_class.new 10 }

  describe '#initialize' do
    it 'has a default capacity argument value' do
      plane = double(:plane)
      subject = described_class.new
      allow(subject).to receive(:stormy?).and_return false
      described_class::DEFAULT_CAPACITY.times { subject.land(plane) }
      expect { subject.land(plane) }.to raise_error 'Airport is full!'
    end
  end

  describe '#land' do
    let(:plane) { double(:plane) }

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'instructs a plane to land' do
      expect(subject).to respond_to(:land).with(1).argument
    end

    it 'stores a plane after landing' do
      expect(subject.land(plane)).to include plane
    end

    context 'when airport is full' do
      it 'prevents landing' do
        10.times { subject.land(plane) }
        expect { subject.land(plane) }.to raise_error 'Airport is full!'
      end
    end

    context 'when weather is stormy' do
      it 'prevents landing' do
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.land(plane) }.to raise_error 'Landing is cancelled due to bad weather!'
      end
    end
  end

  describe '#take_off' do
    let(:plane) { double(:plane) }

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'instructs a plane to take off' do
      expect(subject).to respond_to(:take_off).with(1).argument
    end

    it 'confirms that a plane is no longer at the airport after take_off' do
      subject.land(plane)
      expect(subject.take_off(plane)).to eq plane
    end

    context 'when weather is stormy' do
      it 'prevents take off' do
        subject.land(plane)
        allow(subject).to receive(:stormy?).and_return true
        expect { subject.take_off(plane) }.to raise_error 'Take off is cancelled due to bad weather!'
      end
    end
  end

  context 'when a plane is flying' do
    let(:plane) { double(:plane) }

    before do
      allow(subject).to receive(:stormy?).and_return false
    end

    it 'only planes that are in the airport can take off' do
      subject.land(plane)
      subject.take_off(plane)
      expect { subject.take_off(plane) }.to raise_error 'Plane not in the airport!'
    end

    it 'cannot be in the airport' do
      subject.land(plane)
      flying_plane = subject.take_off(plane)
      expect(subject.planes).not_to include flying_plane
    end
  end

  context 'when a plane has already landed' do
    before do
      allow(subject).to receive(:stormy?).and_return false
    end
    # planes that are landed cannot land again
    it 'can not land the same plane' do
      allow(subject).to receive(:landed?).and_return true
      subject.land(new_plane)

      expect(subject.land(new_plane)).to be_landed
    end
  end

end
