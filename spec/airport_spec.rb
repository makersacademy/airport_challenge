require 'airport'
require 'plane'
require 'weather'

describe Airport do
  # create a fake plane to use across my tests
  let(:fake_plane) { double() }

  describe '#land' do
    it 'makes a plane land in airport' do
      # tell Airport Class(subject) land method to land a dummy plane into hangar
      subject.land(fake_plane)
      # excpect hangar array to include the fake_plane
      expect(subject.hangar).to include(fake_plane)
    end
  end

  describe '#take_off' do
    it 'makes a plane take off from airport' do
      # tell Airport Class(subject) to land a dummy plane into hangar
      subject.land(fake_plane)
      # tell Airport to take_off the dummy plane in hangar
      subject.take_off(fake_plane)
      # check to see if hangar contains dummy plane
      expect(subject.hangar).not_to include(fake_plane)
    end
  end

  describe '#safe_to_operate?' do
    it 'able to continue operations' do
      # set weather up to be not stormy
      dummy_weather = double(:stormy? => false)
      # expect outcome to be safe to operate(when weather applied)
      expect { subject.safe_to_operate?(dummy_weather) }.not_to raise_error
    end
  end
end
