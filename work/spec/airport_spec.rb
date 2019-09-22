require 'airport'

describe Airport do
  it 'exists!' do
    expect(subject.class).to eq Airport
  end

  describe '#initialize' do
    it 'takes a capacity argument upon initialization' do
      expect(Airport).to respond_to(:new).with(1).argument
    end
  end

  it { is_expected.to respond_to(:land).with(1).argument }

  describe '#land' do
    it 'lands a plane at the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.plane).to eq @planes
    end

    it 'raises an error when airport is full' do
      DEFAULT_CAPACITY.times { subject.land double :plane }
      expect { subject.land double :plane }.to raise_error('Airport full')
    end
  end

  it { is_expected.to respond_to(:takeoff) }

  describe '#takeoff' do
    it 'removes a plane' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end
  end
end
