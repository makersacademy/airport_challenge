require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.

# This plane isn't unique at the moment.

describe Airport do
  let(:plane) { double :plane }
  before do
    allow(plane).to receive(:land!)
    allow(plane).to receive(:take_off!)
  end
  context 'taking off and landing' do
    it 'a plane can land' do
      expect(subject.land_plane(plane)).to be nil
    end

    it 'a plane can take off' do
      subject.land_plane(plane)
      expect(subject.plane_take_off(plane)).to eq plane
    end

    it 'a plane cannot take off if the airport is empty' do
      expect { subject.plane_take_off(plane) }.to raise_error 'Airport Empty'
    end
  end

  context 'traffic control' do

    it 'can return the landed planes' do
      expect(subject.planes).to eq []
    end

    it 'a plane cannot land if the airport is full' do
      20.times { subject.land_plane(plane) }
      expect { subject.land_plane(plane) }.to raise_error 'Airport Full'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'weather conditions' do
      xit 'a plane cannot take off when there is a storm brewing'

      xit 'a plane cannot land in the middle of a storm'
    end
  end
end

# Completed Features:
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land
