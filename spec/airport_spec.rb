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

  class Plane;  end #necessary for testing plane_double is a Plane

  # describe 'new/initialize' do

  # end

  describe 'method:is_stormy?' do
    it do expect(subject).to respond_to(:is_stormy?).with(0).argument end
    it 'returns true or false' do
      boolean = subject.is_stormy?
      expect(!!boolean).to eq(boolean)
    end  
  end

  describe 'method:is_full?' do
    it do expect(subject).to respond_to(:is_full?).with(0).argument end
    it 'returns true or false' do
      boolean = subject.is_full?
      expect(!!boolean).to eq(boolean)
    end  #### more work to be done
  end

  describe 'method:instruct_land' do
    it do expect(subject).to respond_to(:instruct_land).with(1).argument end
    it 'raises error when given a none-plane object to land with' do
      plane = double(:non_plane_object)
      allow(plane).to receive(:is_a?).with(Plane).and_return(false)
      expect{subject.instruct_land(plane)}.to raise_error 'Not a plane'
    end
    it 'raises error when asked to land in stormy weather' do
      plane = double(:plane_object)
      allow(plane).to receive(:is_a?).with(Plane).and_return(true)
      allow(subject).to receive(:is_stormy?).and_return(false)
      expect{subject.instruct_land(plane)}.to raise_error "Can't land in stormy weather"
    end

    #xit 'receives a plane'
  end






  describe 'method:instruct_takeoff' do
    it do expect(subject).to respond_to(:instruct_takeoff).with(1).argument end
    it 'raises error when given a none-plane object to takeoff with' do
      plane = double(:non_plane_object)
      allow(plane).to receive(:is_a?).with(Plane).and_return(false)
      expect{subject.instruct_takeoff(plane)}.to raise_error 'Not a plane'
    end
    it 'raises error when given a plane which is not at this airport to takeoff with' do
      plane = double(:plane_object)
      allow(plane).to receive(:is_a?).with(Plane).and_return(true)
      expect{subject.instruct_takeoff(plane)}.to raise_error 'The plane is currently not at this airport'      
    end     
    # it 'allow plane take off when given a plane which is at the airport and weather is not stormy' do
    #   plane = double(:plane_object)
      
    #   allow(plane).to receive(:is_a?).with(Plane).and_return(true)
       
    # end     

  #   xit 'instructs a plane to take off'

  #   xit 'releases a plane'
  end



  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
  #   end

  #   # Include a weather condition.
  #   # The weather must be random and only have two states "sunny" or "stormy".
  #   # Try and take off a plane, but if the weather is stormy,
  #   # the plane can not take off and must remain in the airport.
  #   #
  #   # This will require stubbing to stop the random return of the weather.
  #   # If the airport has a weather condition of stormy,
  #   # the plane can not land, and must not be in the airport

  #   context 'when weather conditions are stormy' do
  #     xit 'does not allow a plane to take off'

  #     xit 'does not allow a plane to land'
  #   end
  # end
end






