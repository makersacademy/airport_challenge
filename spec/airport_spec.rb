require 'airport'

describe Airport do
  let(:plane) {Plane.new}

  let(:p1) {Plane.new}
  let(:p2) {Plane.new}

  describe '#flight_clearance' do
    it 'returns a boolean' do
      expect(subject.flight_clearance?).to eq(true).or eq(false)
    end

    it 'Weather is dynamic and randomly generated' do
      srand(1)
      expect(subject.flight_clearance?).to eq true
      expect(subject.flight_clearance?).to eq true
      expect(subject.flight_clearance?).to eq false
      expect(subject.flight_clearance?).to eq true
      expect(subject.flight_clearance?).to eq false
    end
  end

  describe '#capacity' do
    it 'Airport has a default capcity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it "capcity can be variable" do
      airport = Airport.new(2)
      expect(airport.capacity).to eq 2
    end
  end

  describe '#full?' do
    it 'Returns a boolean' do
      expect(subject.full?).to be(true).or be(false)
    end

    it 'false when not full' do
      expect(subject.full?).to eq false
    end

    it 'true when full' do
      allow(subject).to receive(:flight_clearance?) { true }
      allow(plane).to receive(:location) { 'air' }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect(subject.full?).to eq true
    end
  end

  describe '#land' do
    it 'In sunny weather' do
      allow(subject).to receive(:flight_clearance?) { true }
      expect(subject.land(plane)).to eq [plane]
    end

    it 'Raise error when stormy weather' do
      allow(subject).to receive(:flight_clearance?) { false}
      expect{subject.land(p1)}.to raise_error('Cannot land in stormy weather')
    end

    it 'Raises error when full' do
      allow(subject).to receive(:flight_clearance?) { true }
      allow(plane).to receive(:location) { 'air' }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      expect{subject.land(plane)}.to raise_error('Cannot land. Airport is full.')
    end

    it 'Riase error when attempting landing twice' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      expect{subject.land(p1)}.to raise_error('Cannot land. Plane not in the air.')
    end

    it 'Riase error when attempting to land plane already landed at another airport' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      a2 = Airport.new
      allow(a2).to receive(:flight_clearance?) { true }
      expect{a2.land(p1)}.to raise_error('Cannot land. Plane not in the air.')
    end
  end

  describe '#take_off' do
    it 'In sunny weather' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      expect(subject.take_off(p1)).to eq p1
    end

    it 'Raise error in stormy weather' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      allow(subject).to receive(:flight_clearance?) { false}
      expect{subject.take_off(p1)}.to raise_error('Cannot take off in stormy weather')
    end

    it 'Raise error when plane not in hanger' do
      allow(subject).to receive(:flight_clearance?) { true }
      expect{subject.take_off(p1)}.to raise_error('Cannot take off. Plane not in hanger.')
    end
  end

  describe '#in_hanger?' do
    it 'Returns a boolean' do
      expect(subject.in_hanger?(p1)).to be(true).or be(false)
    end

    it 'Before it has landed' do
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After it has landed' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      expect(subject.in_hanger?(p1)).to eq true
    end

    it 'After it has taken off' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      subject.take_off(p1)
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After attempting to land in stormy weather' do
      allow(subject).to receive(:flight_clearance?) { false }
      subject.land(p1)
      rescue
      expect(subject.in_hanger?(p1)).to eq false
    end

    it 'After attempting to take off in stormy weather' do
      allow(subject).to receive(:flight_clearance?) { true }
      subject.land(p1)
      allow(subject).to receive(:flight_clearance?) { false }
      subject.take_off(p1)
      rescue
      expect(subject.in_hanger?(p1)).to eq true
    end

    it 'After atempting to land when full' do
      allow(subject).to receive(:flight_clearance?) { true }
      allow(plane).to receive(:location) { 'air' }
      allow(p1).to receive(:location) { 'air' }
      described_class::DEFAULT_CAPACITY.times do
        subject.land(plane)
      end
      subject.land(p1)
      rescue
      expect(subject.in_hanger?(p1)).to eq false
      end
  end

end
