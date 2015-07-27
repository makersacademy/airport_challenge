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
    it { is_expected.to respond_to(:release_plane).with(1).argument }

    #xit 'instructs a plane to take off'
  #   NEED TO ADD TEST THAT CHECKS THAT THIS METHOD TRIGGERS THE PLANE.TAKEOFF METHOD?
  #   CAN'T FIGURE OUT HOW TO WRITE THAT TEST IN RSPEC.

    #xit 'releases a plane'
  end


  describe 'receive_plane' do

    it { is_expected.to respond_to(:receive_plane).with(1).argument }

    it 'raises an error when full' do
      # allow(subject).to receive(:full?) { false }
      subject.capacity.times { subject.receive_plane Plane.new }
      expect { subject.receive_plane Plane.new }.to raise_error 'Airport is full'
    end

    it 'raises an error when weather is stormy' do
      allow(subject).to receive(:weather?) { "stormy" }
      expect {subject.receive_plane Plane.new }.to raise_error 'Cannot land due to weather'
    end

    #  NEED TO FIND OUT HOW TO DEAL WITH CONFLICTING TESTS. WHEN BOTH 'FAILS'
    #  ARE TOGETHER THEY DON'T WORK PROPERLY

    #   NEED TO ADD TEST THAT CHECKS THAT THE RECEIVE_PLANE METHOD TRIGGERS THE PLANE.LAND METHOD?
    #   CAN'T FIGURE OUT HOW TO WRITE THAT TEST IN RSPEC.

    #   NEED TO ADD TEST TO CHECK WHETHER RECEIVE_PLANE ADDS THAT PLANE INTO THE ARRAY OF PLANES
    #   IT WORKS IN IRB BUT DON'T KNOW HOW TO PHRASE THE TEST IN RSPEC.
    # it 'adds a landed plane into the array of planes' do
    #   expect { subject.receive_plane }.to change{ @planes.size }.from(0).to(1)
    # end 
  end


  

  
  


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

   # context 'when weather conditions are stormy' do
    #  xit 'does not allow a plane to take off'

    #  xit 'does not allow a plane to land'
    # end
  
end
