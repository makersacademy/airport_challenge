require 'airport'

describe Airport do
  it 'exists!' do
    expect(subject.class).to eq Airport
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

      ##not yet working##
    #   it 'does not let planes land when full' do
    #   DEFAULT_CAPACITY.times { subject.land double :plane }
    #   expect { subject.not_to respond_to(:land) }
    # end

  end

  it { is_expected.to respond_to(:takeoff) }

  describe '#takeoff' do
    it 'removes a plane from the airport' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.takeoff).to eq plane
    end
  end
end
