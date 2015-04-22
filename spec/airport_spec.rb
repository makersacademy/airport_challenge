require 'airport'

# A plane currently in the airport can be requested to take off.
#
# No more planes can be added to the airport, if it's full.
# It is up to you how many planes can land in the airport
# and how that is implemented.
#
# If the airport is full then no planes can land

describe Airport do
  let(:airport) { Airport.new }
  let(:plane) { double :plane }
  context 'taking off and landing' do

    it 'a plane can land' do
      # which I see as the "airport can accept a plane".
      # and that plane should be there when landed. This is what we test.
      airport.plane_lands(plane)
      expect(airport.planes).to eq [plane]
    end

    it 'a plane can take off' do
      airport.weather(1)
      airport.plane_lands(plane)
      airport.plane_takes_off(plane)
      expect(airport.planes).to eq []
    end
  end

  context 'traffic control' do

    it 'the airport has a capacity' do
      # before we talk about full capacity, I want to check a capacity.
      expect(airport.capacity).to eq 50
    end

    it 'an other airport can have a custom capacity' do
      airport2 = Airport.new(200)
      expect(airport2.capacity).to eq 200
    end

    it 'can be full' do
      # before jumpig into the next test, I want to check when its full
      (airport.capacity).times { airport.plane_lands(plane) }
      expect(airport).to be_full
    end

    it 'a plane cannot land if the airport is full' do
      (airport.capacity).times { airport.plane_lands(plane) }
      # rubocop doesn't allow over 80 char. What to do if it's a long code line?
      expect { airport.plane_lands(plane) }.to raise_error 'THE AIRPORT IS FULL'
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
      it 'has a weather. Its sunny or stormy' do
        # before checking planes conditions against weather, I create weather
        expect(airport.weather).to satisfy { 'stormy' || 'sunny' }
      end

      it 'a plane cannot take off when there is a storm brewing' do
        # for the purpose of that test, the weather method always return stormy
        airport.weather(10)
        expect { airport.plane_takes_off(plane) }.to raise_error 'ITS STORMY'
      end
      it 'a plane cannot land in the middle of a storm' do
        airport.weather(10)
        expect { airport.plane_lands(plane) }.to raise_error 'ITS STORMY'
      end
    end
  end
end
