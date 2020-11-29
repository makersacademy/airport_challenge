require 'airport'

describe Airport do
  subject {
    subject = Airport.new
    allow(subject).to receive(:stormy?) { false }
    subject
  }
  let(:stormy_airport) {
    stormy_airport = Airport.new
    allow(stormy_airport).to receive(:stormy?) { true }
    stormy_airport
  }
  let(:plane) { Plane.new }

  it 'allows system designer to override default capacity' do
    expect(Airport).to respond_to(:new).with(1).argument
  end

  it 'initializes with an empty hangar' do
    expect(subject.hangar).to be_empty
  end

  it 'initializes with the default capacity if not overridden' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it 'initializes with a chosen capacity' do
    expect(Airport.new(20).capacity).to eq 20
  end

  it 'responds to instruction "land"' do
    is_expected.to respond_to(:land)
  end

  it 'responds to instruction "take_off"' do
    is_expected.to respond_to(:take_off)
  end

  it 'responds to "full?" query' do
    is_expected.to respond_to(:full?)
  end

  it 'responds to "present?" query' do
    is_expected.to respond_to(:present?)
  end

  it 'responds to "stormy?" query' do
    is_expected.to respond_to(:stormy?)
  end

  describe '.land' do

    it 'takes 1 argument' do
      is_expected.to respond_to(:land).with(1).argument
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

    it 'raises error when stormy' do
      expect { stormy_airport.land(plane) }.to raise_error "Landing aborted due to stormy weather"
    end
  end

  describe '.take_off' do
    it 'takes 1 argument' do
      is_expected.to respond_to(:take_off).with(1).argument
    end

    it 'when plane not in the hangar' do
      subject.land(Plane.new)
      expect { subject.take_off(Plane.new) }.to raise_error "Plane not at this airport"
    end

    context 'when plane is present in hangar' do
      it 'removes correct plane from hangar' do
        subject.land(Plane.new)
        subject.land(plane)
        subject.land(Plane.new)
        subject.take_off(plane)
        expect(subject.hangar.size).to eq 2
        expect(subject.hangar).not_to include(plane)
      end
    end

    it 'raises error when stormy' do
      stormy_airport.hangar << plane
      expect { stormy_airport.take_off(plane) }.to raise_error "Take off aborted due to stormy weather"
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
      subject.land(plane)
      expect(subject.present?(plane)).to be true
    end

    it 'returns false if plane is not in the hangar' do
      subject.land(Plane.new)
      expect(subject.present?(plane)).to be false
    end
  end

end
