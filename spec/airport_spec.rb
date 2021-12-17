require 'airport'

describe Airport do
  
  describe '#land' do
    it 'lets an air traffic controller instruct a plane to land at an aiport' do
      expect(subject).to respond_to(:land).with(1).arguments
    end
    it 'raises an error when a plane tries to land when the airport is full' do
      allow(Airport::FORECAST).to receive(:stormy?) { false }
      Airport::CAPACITY.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "The plane cannot land as airport is at capacity"
    end
    it 'raises an error when a plane tries to land during stormy weather' do
      allow(Airport::FORECAST).to receive(:stormy?) { true }
      expect { subject.land(Plane.new) }.to raise_error "The plane cannot land as it is too stormy"
    end
    it 'raises an error if a plane which is already landed tries to land again' do
      allow(Airport::FORECAST).to receive(:stormy?) { false }
      duplicate_plane = Plane.new
      subject.land(duplicate_plane)
      expect { subject.land(duplicate_plane) }.to raise_error "This plane has already landed and is in the airport"
    end
  end

  describe '#take_off' do
    it 'lets an air traffic controller instruct a plane to take off from an airport' do
      expect(subject).to respond_to(:take_off)
    end
    it 'raises an error when a plane tries to take off during stormy weather' do
      allow(Airport::FORECAST).to receive(:stormy?) { true }
      expect { subject.take_off }.to raise_error "It's too stormy for a plane to take off right now"
    end
  end

  it 'confirms that a plane which has just taken off is no longer at the airport' do
    allow(Airport::FORECAST).to receive(:stormy?) { false }
    2.times { subject.land(Plane.new) }
    subject.take_off
    expect(subject.gone?).to eq true
  end

  it 'lets the Default Capacity of an airport be overridden' do
    subject.override_capacity(10)
    expect(Airport::CAPACITY).to eq 10
  end

end
