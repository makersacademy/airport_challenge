
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land
require 'airport.rb'

describe Airport do

  let(:plane){double(:plane, {land: "landed", takeoff: "flying"})}

    describe 'takeoff operations' do

     it 'allows a plane to take off' do
       expect(plane).to receive(:takeoff)
       subject.allow_to_takeoff(plane)
     end
     it 'releases a plane' do
       subject.allow_to_land(plane)
       subject.allow_to_takeoff(plane)
       expect(subject.planes).not_to include(plane)
     end
   end

   describe 'landing opeartions' do

     it 'allows a plane to land' do
       expect(plane).to receive(:land) # I had to invert them here, make sure I get why
       subject.allow_to_land(plane)
     end
     it 'receives a plane' do
       subject.allow_to_land(plane)
       expect(subject.planes).to include(plane)
     end
    end
  #
  # describe 'traffic control' do
  #   context 'when airport is full' do
  #     xit 'does not allow a plane to land'
    #end

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
