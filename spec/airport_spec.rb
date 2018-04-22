require 'airport'

describe Airport, :airport do
  let(:current_plane) { instance_double Plane, land: false }
  let(:next_fly_plane) { instance_double Plane, land: false }
  let(:land_plane) { instance_double Plane, takeoff: true }
  let(:next_land_plane) { instance double Plane, takeoff: true}
  let(:stormy_weather) { instance_double Weather, stormy?: true }
  let(:good_weather) { instance_double Weather, stormy?: false }

  describe '#land' do
    it 'is expected to land planes' do
      subject.land(current_plane, good_weather)
      expect(subject.planes).to include current_plane
    end

    it 'is expected in stormy weather for planes not to land', :stormy_land do
      expect { subject.land(current_plane, stormy_weather) }.to raise_error "It's stormy! No landing!"
    end

    it 'stores the planes when they land' do
      is_expected.to respond_to(:planes)
      expect(subject.planes).to eq []
    end
  end

  describe '#capacity' do
    it 'should default to the capacity of 20' do
      expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
    end

    it 'has a variable capacity on initialisation' do
      capacity_two = 10
      airport = Airport.new(capcity_two)
      expect(airport.capacity).to eq capacity_two
    end
    
    it 'doesnt let a plane land if airport is at full capacity' do
      Airport::DEFAULT_CAPACITY.times { subject.land(current_plane, good_weather) }
      expect { subject.land(current_plane, good_weather) }.to raise_error 'Airport is full!'
    end
  end

  describe '#planes' do
    it { is_expected.to respond_to(:planes) }

    it 'expected to initialize with no planes' do
          expect(subject.planes).to eq []
    end
  end

  describe '#takeoff' do
    it { is_expected.to respond_to(:takeoff).with(1).argument }

    it 'is expected for planes to take off' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'is expected to take away a plane after takeoff' do
      subject.land(plane)
      expect(subject.takeoff(plane)).to eq plane
    end

    it 'is expected not to let planes take off in stormy weather', :storm_take_off do
      subject.planes = [land_plane]
      expect { subject.takeoff(land_plane, stormy_weather) }.to raise_error "It's stormy! No take off!"
    end
  end
end
end
