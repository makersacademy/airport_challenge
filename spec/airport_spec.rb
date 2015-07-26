require 'airport'

## Note these are just some guidelines!
## Feel free to write more tests!!

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  it { is_expected.to respond_to :dock.with(1).argument }
  it { is_expected.to respond_to :take_off }

  describe '#take_off' do
    xit 'instructs a plane to take off'
    subject.take_off
    expect(@plane).to be_landed
  end

    xit 'releases a plane'
    it 'raises an error when plane is flying' do
      expect { subject.take_off }.to raise_error 'Plane is flying'
  end

  describe '#landing' do
    xit 'instructs a plane to land'
    subject.dock_plane Plane.new
    plane = subject.dock_plane
    expect(plane).to be_flying
    xit 'receives a plane'
      it 'raises an error when plane is landed' do
        expect { subject.dock_plane }.to raise_error 'Plane is landed'
      end
  end

  describe '#traffic_control' do
    it 'Keeps plane from landing or departing'
      subject.traffic_control

    context 'when airport is full' do
    xit 'does not allow a plane to land'
        expect { subject.dock_plane }.to raise_error 'Airport full'
    end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'
        expect { subject.take_off }.to raise_error 'Inclement weather, cannot take off'


      xit 'does not allow a plane to land'
        expect { subject.take_off }.to raise_error 'Inclement weather, cannot land'
    end
  end
end
