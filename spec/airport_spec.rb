require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # create a fake plane to use across my tests
  let(:fake_plane) { double() }

  describe '#land' do
    it 'makes a plane land in airport' do
      # tell Airport Class(subject) to land my dummy plane into a hangar
      subject.land(fake_plane)
      # excpect hangar array to include the fake_plane
      expect(subject.hangar).to include(fake_plane)
    end

    it 'if hangar capacity is reached, and plane requests to land, throw an error' do
      # force hangar to reach capacity by filling it with fake planes
      Airport::DEFAULT_CAPACITY.times { subject.land(fake_plane) }
      expect { subject.land(fake_plane) }.to raise_error(RuntimeError)
    end
  end

  describe '#take_off' do
    it 'makes a plane take off from airport' do
      # tell Airport Class(subject) to land my dummy plane into a hangar
      subject.land(fake_plane)
      # tell Airport Class(subject) to take off a plane from the hangar
      subject.take_off(fake_plane)
      # expect hangar array to not include plane
      expect(subject.hangar).not_to include(fake_plane)
    end

    it 'if hangar is empty, and plane requests to take off, throw and error' do
      expect { subject.take_off(fake_plane) }.to raise_error(RuntimeError)
    end
  end

  describe '@capacity' do
    it 'if capacity is specified, it overwrites the default capacity' do
      # see if a custom capacity can be set
      expect(Airport.new(100).capacity).to eq(100)
    end
  end
end
