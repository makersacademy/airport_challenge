require 'airport'

describe Airport do
  subject {
    subject = Airport.new
    allow(subject).to receive(:stormy?) { false }
    subject
  }
  let(:plane) { double :Plane }

  it 'allows system designer to override default capacity' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'initializes with the default capacity if not overridden' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'initializes with a chosen capacity' do
    expect(Airport.new(20).capacity).to eq 20
  end

  it 'initializes with an empty hangar' do
    expect(subject.hangar).to be_empty
  end

  describe '.land' do
    before do
      allow(plane).to receive(:land)
    end

    it 'instructs the plane to land' do
      expect(plane).to receive(:land)
      subject.land(plane)
    end

    it 'stores plane in hangar' do
      subject.land(plane)
      expect(subject.hangar[-1]).to eq plane
    end

    it 'raises error when airport full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect { subject.land(Plane.new) }.to raise_error "Airport full"
    end

    it 'raises error when plane on ground' do
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already landed"
    end

  end

  describe '.take_off' do
    it 'when plane not in the hangar' do
      subject.land(Plane.new)
      message = "Plane not at this airport"
      expect { subject.take_off(plane) }.to raise_error message
    end

    context 'when plane is present in hangar' do
      before(:each) do
        allow(plane).to receive(:land)
        allow(plane).to receive(:depart)
        subject.land(plane)
        subject.land(Plane.new)
      end

      it 'removes correct plane from hangar' do
        subject.take_off(plane)
        expect(subject.hangar).not_to include(plane)
      end

      it 'tells the correct plane to depart' do
        expect(plane).to receive(:depart)
        subject.take_off(plane)
      end
    end

  end

  describe '#full?' do
    it 'returns true if hangar is full' do
      subject.capacity.times { subject.land(Plane.new) }
      expect(subject.full?).to be true
    end
  end

  describe '#present?' do
    it 'returns true if plane is in the hangar' do
      allow(plane).to receive(:land)
      subject.land(plane)
      expect(subject.present?(plane)).to be true
    end

    it 'returns false if plane is not in the hangar' do
      subject.land(Plane.new)
      expect(subject.present?(plane)).to be false
    end
  end

  context 'when it is stormy' do
    subject {
      stormy_airport = Airport.new
      allow(stormy_airport.weather).to receive(:stormy?) { true }
      stormy_airport
    }

    describe '#stormy?' do
      it 'returns true' do
        expect(subject.stormy?).to be true
      end
    end

    describe '.take_off' do
      it 'raises error when trying to take_off' do
        subject.hangar << plane
        message = "Take off aborted due to stormy weather"
        expect { subject.take_off(plane) }.to raise_error message
      end
    end

    describe '.land' do
      it 'raises error when trying to land' do
        message = "Landing aborted due to stormy weather"
        expect { subject.land(plane) }.to raise_error message
      end
    end

  end

end
