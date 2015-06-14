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

it { is_expected.to respond_to :release_plane }

it {is_expected.to respond_to(:land).with(1).argument}


  # describe 'release plane' do
  #   it 'instructs a plane to take off' do
  #     plane = double :plane, landed?: true
  #     expect(subject.take_off).to release_plane
    # end

    # it 'releases a plane' do
    #   plane = double :plane, landed?: true
    #   expect(subject.release_plane).to eq double :plane, landed?: false
    # end

  # describe 'landing' do
  #   it 'instructs a plane to land' do

  #   end

    # it 'receives a plane' do
    # end

  describe 'traffic control' do

    it 'there is a DEFAULT capacity' do
      expect(subject.capacity).to eq Airport::CAPACITY
    end 
    
    # context 'when airport is full' do

    #   it 'does not allow a plane to land' do
    #   subject.capacity.times(subject.land double :plane)
    #   expect(subject.land double :plane).to raise_error 'Airport is full'
    #   expect 
    #   end

#     # Include a weather condition.
#     # The weather must be random and only have two states "sunny" or "stormy".
#     # Try and take off a plane, but if the weather is stormy,
#     # the plane can not take off and must remain in the airport.
#     #
#     # This will require stubbing to stop the random return of the weather.
#     # If the airport has a weather condition of stormy,
#     # the plane can not land, and must not be in the airport

#     context 'when weather conditions are stormy' do
#       xit 'does not allow a plane to take off'

#       xit 'does not allow a plane to land'
    # end
  end
end
