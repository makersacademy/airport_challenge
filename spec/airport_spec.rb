require 'airport'

describe Airport do
  let(:plane) { instance_double Plane }
  let(:stormy_weather) { instance_double Weather, stormy?: true }
  let(:calm_weather) { instance_double Weather, stormy?: false }

  describe '#capacity' do
    it { is_expected.to respond_to(:capacity) }

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
    it { is_expected.to respond_to(:planes) }

    it 'is expected to initialize with no planes' do
      expect(subject.planes).to eq []
    end
  end

  describe '#land' do
    it { is_expected.to respond_to(:land).with(2).argument }

    it 'is expected to land planes' do
      subject.land(plane, calm_weather)
      expect(subject.planes).to eq [plane]
    end

    it 'is expected not to land planes in stormy weather', :storm_land do
      expect { subject.land(plane, stormy_weather) }.to raise_error "It's too stormy!"
    end

    it 'wont land planes in a full airport' do
      Airport::CAPACITY.times { subject.land(plane, calm_weather) }
      expect { subject.land(plane, calm_weather) }.to raise_error 'Airport full.'
    end
  end

  describe '#take_off' do
    it { is_expected.to respond_to(:take_off).with(2).argument }

    it 'is expected to take off a plane' do
      subject.land(plane, calm_weather)
      expect(subject.take_off(plane, calm_weather)).to eq plane
    end

    it 'is expected to no longer contain plane after take off' do
      subject.land(plane, calm_weather)
      expect(subject.planes).to eq [plane]
      subject.take_off(plane, calm_weather)
      expect(subject.planes).to eq []
    end

    it 'is expected to still contain one plane after another takes off' do
      plane1 = double(:plane)
      plane2 = double(:plane)
      subject.land(plane1, calm_weather)
      subject.land(plane2, calm_weather)
      subject.take_off(plane1, calm_weather)
      expect(subject.planes).to eq [plane2]
    end

    it 'is expected not to take off planes in stormy weather', :storm_take_off do
      subject.land(plane, calm_weather)
      expect { subject.take_off(plane, stormy_weather) }.to raise_error "It's too stormy!"
    end

    it 'raises an error if taking off plane not in airport', :no_plane do
      expect { subject.take_off(plane, calm_weather) }.to raise_error 'Plane not in airport.'
    end
  end
end
