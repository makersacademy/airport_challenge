require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # set class up explicitly
  airport(:airport) { described_class.new }

  # create some dummy weather conditions
  before(:each) do
    @fake_good_weather = double(:weather, :stormy? => false)
    @fake_stormy_weather = double(:weather, :stormy? => true)
  end

  # create a fake plane to use across my tests
  let(:fake_plane) { double() }

  describe '#land' do
    it 'makes a plane land in airport' do
      # tell Airport Class(airport) to land my dummy plane into a hangar
      airport.land(fake_plane, @fake_good_weather)
      # expect hangar array to include the fake_plane
      expect(airport.hangar).to include(fake_plane)
    end

    it 'does not allow plane land in airport due to stormy weather' do
      expect { airport.land(fake_plane, @fake_stormy_weather) }.to raise_error(RuntimeError)
    end

    it 'if hangar capacity is reached, and plane requests to land, throw an error' do
      # force hangar to reach capacity by filling it with fake planes
      Airport::DEFAULT_CAPACITY.times { airport.land(fake_plane, @fake_good_weather) }
      expect { airport.land(fake_plane, @fake_good_weather) }.to raise_error(RuntimeError)
    end
  end

  describe '#take_off' do
    it 'makes a plane take off from airport' do
      # tell Airport Class(airport) to land my dummy plane into a hangar
      airport.land(fake_plane, @fake_good_weather)
      # tell Airport Class(airport) to take off a plane from the hangar
      airport.take_off(fake_plane, @fake_good_weather)
      # expect hangar array to not include plane
      expect(airport.hangar).not_to include(fake_plane)
    end

    it 'does not allow plane to take off from airport due to stormy weather' do
      expect { airport.take_off(fake_plane, @fake_stormy_weather) }.to raise_error(RuntimeError)
    end

    it 'if hangar is empty, and plane requests to take off, throw an error' do
      expect { airport.take_off(fake_plane, @fake_good_weather) }.to raise_error(RuntimeError)
    end
  end

  describe '@capacity' do
    it 'if capacity is specified, it overwrites the default capacity' do
      # see if a custom capacity can be set
      expect(Airport.new(100).capacity).to eq(100)
    end
  end
end
