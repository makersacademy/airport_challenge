require 'airport'

describe Airport do
  let(:plane) { Plane.new }

  it 'can create an instance of Airport' do
    airport = Airport.new
    expect(airport).to be_kind_of Airport
  end

  describe '#initialize' do
    it 'initializes with an empty planes array' do
      expect(subject.planes).to be_empty
    end

    it 'initializes with a default capacity, if not provided' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'initializes with a capacity if provided' do
      airport = Airport.new(20)
      expect(airport.capacity).to eq 20
    end

    it 'initializes with a weather condition' do
      expect(subject.weather_conditions). to be_kind_of Weather
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(1).argument }

    it 'has a plane land' do
      expect(subject.land plane).to eq [plane]
    end

    it 'raises an error when the airport is full' do
      Airport::DEFAULT_CAPACITY.times { subject.land Plane.new }
      expect { subject.land plane }.to raise_error "Airport is full"
    end

    it 'sets a plane as landed' do
      expect { subject.land plane }.to change { plane.flying }.to false
    end

    it 'raises an error if the plane has already landed' do
      duplicated_plane = Plane.new
      subject.land duplicated_plane
      expect { subject.land duplicated_plane }.to raise_error "This plane has already landed"
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to :takeoff }

    it 'has a plane take off' do
      allow(subject).to receive(:stormy?) { false }
      subject.land plane
      expect(subject.takeoff).to eq plane
    end

    it 'decreases in count after take off' do
      allow(subject).to receive(:stormy?) { false }
      difference = 1

      subject.land plane
      initial_count = subject.planes.count

      subject.takeoff
      final_count = subject.planes.count

      expect(initial_count - final_count).to eq difference
    end

    it 'changes the plane to flying' do
      allow(subject).to receive(:stormy?) { false }
      subject.land plane
      expect { subject.takeoff }.to change { plane.flying }.to true
    end

    it 'raises an error when there are no planes' do
      expect { subject.takeoff }.to raise_error "No planes are at the airport"
    end

    it 'raises an error when the weather is stormy' do
      airport = Airport.new
      airport.land plane
      allow(airport).to receive(:stormy?) { true }
      expect { airport.takeoff }.to raise_error "Unable to take off due to stormy weather"
    end
  end
end
