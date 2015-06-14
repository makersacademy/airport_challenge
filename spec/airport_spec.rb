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

  it { is_expected.to respond_to(:capacity) }

  describe 'release_plane' do
    it {is_expected.to respond_to(:release_plane).with(1).argument }

    xit 'instructs a plane to take off'

    xit 'releases a plane'
  end


  describe 'receive_plane' do

    it { is_expected.to respond_to(:receive_plane).with(1).argument }

    it 'raises an error when full' do
      plane = Plane.new
      subject.capacity.times { subject.receive_plane plane }
      expect { subject.receive_plane plane }.to raise_error 'Airport is full'
    end
  end

  #   NEED TO ADD TEST THAT CHECKS THAT THIS METHOD TRIGGERS THE PLANE.LAND METHOD?
  #   CAN'T FIGURE OUT HOW TO WRITE THAT TEST IN RSPEC.
  # end

  

  # describe 'receive_plane' do
  #   it 'raises an error when full' do
  #     plane = Plane.new
  #     subject.capacity.times { subject.receive_plane plane }
  #     expect { subject.receive_plane plane }.to raise_error 'Airport is full'
  #   end
  # end

    xit 'receives a plane'

    xit 'raises an error when airport is full'
  
  


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

    context 'when weather conditions are stormy' do
      xit 'does not allow a plane to take off'

      xit 'does not allow a plane to land'
    end
  
end
