require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to(:plane) }
  it { is_expected.to respond_to(:take_off).with(1).argument}

  it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  describe '#land' do
    it 'lands plane at airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes[0]).to eq plane
    end

    it 'raises an error when airport is full' do
      Airport::DEFAULT_CAPACITY.times do
        subject.land Plane.new
      end
      expect { subject.land Plane.new }.to raise_error 'Airport is full'
    end

    it 'blocks landing when weather is stormy' do
      allow(subject).to receive(:stormy?).and_return(true)
      expect { subject.land Plane.new }.to raise_error 'Storm prevented landing'
    end

    it 'returns planes that landed' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes[0]).to eq plane
    end
  end

  it 'allows planes to take off' do
    plane = Plane.new
    subject.take_off(plane)
    expect(subject.plane).to eq plane
  end
end
