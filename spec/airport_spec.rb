require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # create a fake plane to use across my tests
  let(:fake_plane) { double() }

  describe '#land' do
    it 'makes a plane land in airport' do
      # tell Airport Class(subject) land method to land my dummy plane into a hangar array
      subject.land(fake_plane)
      # excpect hangar array to include the fake_plane
      expect(subject.hangar).to include(fake_plane)
    end
  end

  describe '#take_off' do
    it 'makes a plane take off from airport' do
      subject.land(fake_plane)
      subject.take_off(fake_plane)
      expect(subject.hangar).not_to include(fake_plane)
    end
  end
end
