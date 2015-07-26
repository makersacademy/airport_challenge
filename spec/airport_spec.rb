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

  describe 'airport' do
    it 'does an airport have some capacity' do
      expect(subject).to respond_to :capacity
    end
    it 'inventory goes up when plane comes in and down when plane leaves' do 
      pln = double()
      allow(subject).to receive(:weather_state).and_return(true) 
      expect{ subject.plane_in pln }.to change{ subject.plane_size }.from(0).to(1)
      expect{ subject.plane_out pln }.to change{ subject.plane_size }.from(1).to(0)      
    end
  end
  describe 'traffic control' do
    context 'when airport is full' do
      it 'does not allow a plane to land' do
        pln = double()
        subject.plane_in pln
        expect(subject.plane_in pln).to be false
      end
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

      it 'does not allow a plane to land' do
        allow(subject).to receive(:weather_state).and_return(false) 
        expect(subject.plane_in :plane).to be false
      end

      it 'does not allow a plane to take off' do
        allow(subject).to receive(:weather_state).and_return(false) 
        expect(subject.plane_out :plane).to be false
      end


    end

  end
end
