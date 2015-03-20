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
    # now planes land in an array so does that array increase in size
    # when a plane is landed
    it 'can land a plane' do
      # get current size of the array
      planes = subject.num_planes
      # add a new plane
      subject.land_plane :plane
      # check if number of planes landed has increase
      expect(subject.num_planes).to eq(planes + 1)
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
      subject.land_plane :plane
      # expect(subject.takeoff_plane).to be one of the planes
      plane = subject.planes.last
      expect(subject.takeoff_plane).to eq(plane)
    end

  end

  context 'traffic control' do

    # 'an airport has an airtraffic control (atc)'
    # I'll first hold this functionality in a method
    # and extract it into a class if needed later
    # be MINDFUL to keep this method as isolated as possible
    it { is_expected.to respond_to :atc }

    # xit 'a plane cannot land if the airport is full'
    # we need to know if the airport is full
    # and to be full it needs a capacity, which will be a constant
    # NOTE in future could call airport_instance::CONSTANT to get
    # capcity when atc is extracted to a class
    # -- airport should have a capcity of 20
    it 'should have a capcity of 20' do
      expect(subject.capcity).to eq 20
    end
    # airport should raise an error if full
    # so in a minute we'll need to add a way for it to be full
    it 'raise and error when full' do
      # we fill the airport up
      20.times { subject.land_plane :plane }
      # then try and land another plane
      expect { subject.land_plane :plane }.to raise_error 'Airport Full'
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
      # the airport needs to know what the weather is
      it { is_expected.to respond_to :weather }
      it 'should return true if weather is sunny' do
        weather = double('Weather', weather: 'sunny')
        expect(subject.weather(weather)).to eq true
      end
      xit 'a plane cannot take off when there is a storm brewing' do
        # want to check the weather and add a condition to take off method
        # so i'll have to modify the above weather test to check for
        # value of some bool and use that bool in take off
      end
      xit 'a plane cannot land in the middle of a storm'
    end
  end
end
