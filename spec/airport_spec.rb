require 'airport'

describe Airport do

  let(:plane) { Plane.new }

  it { is_expected.to respond_to(:land).with(1).argument }
  it { is_expected.to respond_to :takeoff }

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
      expect(subject.weather_conditions).to be_kind_of Weather
    end

    it 'returns a string weather condition' do
      condition = subject.weather_conditions
      expect(condition.weather).to be_kind_of String
    end
  end

  describe '#stormy?' do
    it 'returns a boolean value' do
      expect(subject.send :stormy?).to be(true).or be(false)
    end
  end

  describe '#land' do
    context 'when weather is sunny' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end

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

    context 'when the weather is stormy' do
      before do
        allow(subject).to receive(:stormy?) { true }
      end
      it 'raises an error' do
        expect { subject.land plane }.to raise_error "Unable to land due to stormy weather"
      end
    end
  end

  describe '#takeoff' do
    it 'raises an error when there are no planes' do
      expect { subject.takeoff }.to raise_error "No planes are at the airport"
    end

    context 'when the weather is sunny' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end

      it 'has a plane take off' do
        subject.land plane
        expect(subject.takeoff).to eq plane
      end
  
      it 'decreases in count after take off' do
        difference = 1
  
        subject.land plane
        initial_count = subject.planes.count
  
        subject.takeoff
        final_count = subject.planes.count
  
        expect(initial_count - final_count).to eq difference
      end
  
      it 'changes the plane to flying' do
        subject.land plane
        expect { subject.takeoff }.to change { plane.flying }.to true
      end
    end

    context 'when the weather is stormy' do
      before do
        allow(subject).to receive(:stormy?) { false }
      end

      it 'raises an error' do
        subject.land plane
        allow(subject).to receive(:stormy?) { true }
        expect { subject.takeoff }.to raise_error "Unable to take off due to stormy weather"
      end
    end
  end
end
