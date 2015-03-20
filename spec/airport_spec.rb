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

  context 'taking off and landing' do

    # 'a plane can land'
    # landing plane method
    it { is_expected.to respond_to :land_plane }
    # can something land? i.e does the method hold what we give it?
    it 'can land a plane' do
      expect(subject.land_plane :plane).to eq :plane
    end

    # 'a plane can take off'
    # bad grammer but I want to be consitent in method names
    # taking off method exists?
    it { is_expected.to respond_to :takeoff_plane }
    # if the airport is empty then it can't have a plane take off
    # so we don't give the airport a plane for this test
    it 'raises error when airport is empty' do
      expect { subject.takeoff_plane }.to raise_error 'No plane to takeoff'
    end
    # taking off method returns the plane that landed
    it 'can takeoff a plane' do
      # to set up the test we ...
      # need to give it a plane to take off!!
      # and we know the land_plane method works already b'cos ^
      # subject.land_plane :plane
      # expect(subject.takeoff_plane)
    end

  end

  context 'traffic control' do

    xit 'a plane cannot land if the airport is full'

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
