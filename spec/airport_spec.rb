require 'airport'
require 'plane'

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

   it 'has a default capacity' do
    expect(subject.capacity).to eq Airport::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to :check_the_weather}


  describe 'instruct_plane'

   it {is_expected.to respond_to :instruct_plane}


  describe 'release_plane'

    it {is_expected.to respond_to :release_plane}

    it 'releases a plane' do
    plane = double :plane
    subject.landing plane
    expect(subject.release_plane).to be plane
    end




  describe 'landing'

    it {is_expected.to respond_to :landing}

    it 'raise an error if full' do
      subject.capacity.times {subject.landing double :plane}
      expect {subject.landing :plane}.to raise_error "\n\n*****   Airport is full   *****\n\n".upcase



    end







  # describe 'take off' do
  #   it 'instructs a plane to take off'
  #   subject.is_expected.to respond_to :instruct_plane

  #   xit 'releases a plane'
  # end

  # describe 'landing' do
  #   xit 'instructs a plane to land'

  #   xit 'receives a plane'
  # end

  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
  #   end

    # Include a weather condition.
    # The weather must be random and only have two states "sunny" or "stormy".
    # Try and take off a plane, but if the weather is stormy,
    # the plane can not take off and must remain in the airport.
    #
    # This will require stubbing to stop the random return of the weather.
    # If the airport has a weather condition of stormy,
    # the plane can not land, and must not be in the airport

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'

  #     xit 'does not allow a plane to land'
  #   end
  # end
end
