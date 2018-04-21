require 'airport'

describe Airport, :airport do
  let(:flying_plane) { instance_double Plane, land: false }
  let(:other_flying_plane) { instance_double Plane, land: false }
  let(:landed_plane) { instance_double Plane, take_off: true }
  let(:other_landed_plane) { instance_double Plane, take_off: true }
  let(:stormy_weather) { instance_double Weather, stormy?: true }
  let(:calm_weather) { instance_double Weather, stormy?: false }

  describe '#capacity' do
    it 'should have a default capacity of 20' do
      expect(subject.capacity).to eq Airport::CAPACITY
    end

    it 'should have variable capacity on initialization' do
      different_capacity = 30
      airport = Airport.new(different_capacity)
      expect(airport.capacity).to eq different_capacity
    end
  end

  describe '#planes' do
    it 'is expected to initialize with no planes' do
      expect(subject.planes).to be_empty
    end
  end

  describe '#land' do
    it 'is expected to land planes' do
      subject.land(flying_plane, calm_weather)
      expect(subject.planes).to include flying_plane
    end

    it 'is expected not to land planes in stormy weather', :storm_land do
      expect { subject.land(flying_plane, stormy_weather) }.to raise_error "It's too stormy!"
    end

    it 'wont land planes in a full airport' do
      Airport::CAPACITY.times { subject.land(flying_plane, calm_weather) }
      expect { subject.land(flying_plane, calm_weather) }.to raise_error 'Airport full.'
    end
  end

  describe '#take_off' do
    class Airport
      attr_writer :planes
    end

    it 'is expected to return a taking off a plane' do
      subject.planes = [landed_plane]
      expect(subject.take_off(landed_plane, calm_weather)).to eq landed_plane
    end

    it 'is expected to no longer contain plane after take off' do
      subject.planes = [landed_plane]
      subject.take_off(landed_plane, calm_weather)
      expect(subject.planes).to be_empty
    end

    it 'is expected to still contain one plane after another takes off' do
      subject.planes = [landed_plane, other_landed_plane]
      subject.take_off(landed_plane, calm_weather)
      expect(subject.planes).to include other_landed_plane
    end

    it 'is expected not to take off planes in stormy weather', :storm_take_off do
      subject.planes = [landed_plane]
      expect { subject.take_off(landed_plane, stormy_weather) }.to raise_error "It's too stormy!"
    end

    it 'raises an error if taking off plane not in airport', :no_plane do
      expect { subject.take_off(landed_plane, calm_weather) }.to raise_error 'Plane not in airport.'
    end
  end

  describe '#multiple_actions' do
    it 'takes off and lands multiple planes' do
      subject.land(flying_plane, calm_weather)
      subject.land(other_flying_plane, calm_weather)
      expect(subject.planes).to eq [flying_plane, other_flying_plane]
      subject.planes = [landed_plane, other_landed_plane]
      subject.take_off(landed_plane, calm_weather)
      subject.take_off(other_landed_plane, calm_weather)
      expect(subject.planes).to be_empty
    end
  end
end
