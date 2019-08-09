require 'airport'

describe Airport do
  describe '#land' do
    it 'can instruct a plane to land' do
      plane = Plane.new
      subject.land(plane)
      expect(subject.planes).to include(plane)
    end

    it 'raises an error if the plane is already in the airport' do
      plane = Plane.new
      subject.land(plane)
      expect { subject.land(plane) }.to raise_error "Plane already landed"
    end

    it 'raises an error when the airport is full' do
      plane = Plane.new
      subject.land(plane)
      allow(subject).to receive(:full?).and_return(true)
      expect { subject.land(plane) }.to raise_error "Airport full"
    end
  end

  describe '#takeoff' do
    it 'can instruct a plane to takeoff' do
      plane = Plane.new
      subject.land(plane)
      subject.takeoff(plane)
      expect(subject.planes).not_to include(plane)
    end

    it 'raises an error if plane is not in the airport' do
      plane = Plane.new
      expect { subject.takeoff(plane) }.to raise_error "Plane is not in the airport"
    end
  end

  describe '#full?' do
    it 'returns true if airport is full' do
      subject.capacity = 0
      expect(subject.full?).to eq(true)
    end

    it 'returns false if airport is not full' do
      expect(subject.full?).to eq(false)
    end
  end

  describe '#capacity' do
    it 'shows a default capacity if not overriden' do
      expect(subject.capacity).to eq(Airport::DEFAULT_CAPACITY)
    end

    it 'can be overriden' do
      subject.capacity = 200
      expect(subject.capacity).to eq(200)
    end
  end
end
