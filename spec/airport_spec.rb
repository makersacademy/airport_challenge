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
  let(:airport) { Airport.new }
  let(:weather) { double :weather, condition: 'sunny' }

  context 'when created' do
    it 'has an empty hangar' do
      expect(airport.hangar.count).to eq 0
    end

    it 'the hangar has a capacity of 10' do
      expect(airport.capacity).to eq 10
    end
  end

  context 'traffic control' do

    it 'can land plane' do
      airport.land(:plane)
      expect(airport.hangar.count).to eq 1
    end

    it 'cannot land plane if the airport is full' do
      Airport::DEFAULT_CAPACITY.times { airport.land :plane }
      expect { airport.land :plane }.to raise_error 'Airport full'
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
      before(:example) do
        weather = double :weather, condition: 'stormy'
        airport.weather(weather)
      end

      it 'a plane cannot land in the middle of a storm' do
        expect { airport.land :plane }.to raise_error 'Cannot land in storm'
      end

      xit 'a plane cannot take off when there is a storm brewing' do
      end

    end
  end
end
