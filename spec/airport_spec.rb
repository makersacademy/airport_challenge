require 'airport'

describe Airport do
  it { is_expected.to respond_to(:land).with(1).argument }

  it { is_expected.to respond_to :take_off }

  describe 'initialization' do
    it 'has a variable capacity' do
      airport = Airport.new(3)
      3.times { airport.land Plane.new }
      expect { airport.land Plane.new }.to raise_error 'Airport full, no landing availability'
    end

    it 'has default capacity' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end
  end

  describe '#land' do
    it 'plane landing' do
      plane = Plane.new
      expect(subject.land(plane).last).to eq plane
    end

    it 'prevent landing when airport is full' do
      subject.capacity.times { subject.land Plane.new }
      expect { subject.land Plane.new }.to raise_error 'Airport full, no landing availability'
    end

    it 'reject to land planes already landed' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error 'Error, plane already at the airport'
    end
  end

  describe '#take_off' do
    it 'plane take off' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return false
      expect(subject.take_off).to eq plane
    end

    it 'print plane' do
      expect(subject.print_take_off).to eq 'A plane has taken off'
    end

    it 'raise error when stormy' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:stormy?).and_return true
      expect { subject.take_off }.to raise_error 'Stormy weather, no takes off'
    end

    it 'raise error when empty' do
      allow(subject).to receive(:empty?).and_return true
      expect { subject.take_off }.to raise_error 'Cannot take off, airport empty'
    end
  end
end
