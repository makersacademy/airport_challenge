require 'airport'

describe Airport do
  subject(:airport) { described_class.new }

  let(:fake_plane) { double(:adjust_status => 'flying') }

  before(:each) do
    @fake_good_weather = double(:weather, :stormy? => false)
    @fake_stormy_weather = double(:weather, :stormy? => true)
  end

  describe '#land' do
    it 'makes a plane land in airport' do
      airport.land(fake_plane, @fake_good_weather)
      expect(airport.hangar).to include(fake_plane)
    end

    it 'does not allow plane land in airport due to stormy weather' do
      expect { airport.land(fake_plane, @fake_stormy_weather) }.to raise_error(RuntimeError)
    end

    it 'if hangar capacity is reached, and plane requests to land, throw an error' do
      Airport::DEFAULT_CAPACITY.times { airport.land(fake_plane, @fake_good_weather) }
      expect { airport.land(fake_plane, @fake_good_weather) }.to raise_error(RuntimeError)
    end
  end

  describe '#take_off' do
    it 'makes a plane take off from airport' do
      airport.land(fake_plane, @fake_good_weather)
      airport.take_off(fake_plane, @fake_good_weather)
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
      expect(Airport.new(100).capacity).to eq(100)
    end
  end
end
