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
  let(:airport){Airport.new}

  context 'taking off and landing' do

    it {is_expected.to respond_to(:land).with(1).argument}
    it {is_expected.to respond_to(:release)}

  end

  context 'traffic control' do

    it 'a plane cannot land if the airport is full' do
        plane = double(:plane)
        allow(plane).to receive(:lands).and_return(false)
        airport.capacity.times{airport.land plane}
        expect {airport.land plane}.to raise_error "Airport is full"
    end

    it 'a plane cannot take off if there are no planes' do
        expect{airport.release}.to raise_error "No planes to take off"
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
      it 'a plane cannot take off when there is a storm brewing' do
          plane = double(:plane)
          allow(plane).to receive(:lands).and_return(false)
          airport.land plane
          allow(airport).to receive(:stormy?).and_return(true)
          expect{airport.release}.to raise_error "Weather is stormy"
      end

      it 'a plane cannot land in the middle of a storm' do
          plane = double(:plane)
          allow(plane).to receive(:lands).and_return(false)
          allow(airport).to receive(:stormy?).and_return(true)
          expect{airport.land plane}.to raise_error "Weather is stormy"
      end
    end
  end
end
