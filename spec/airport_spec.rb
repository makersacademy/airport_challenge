require 'airport'

describe Airport do
  let(:my_airport) { Airport.new(20, double('weather double', :stormy? => false)) }

  context 'creating an airport' do
    it 'can be instantiated with a capacity' do
      weather_double = double('weather double', :stormy? => false)
      airport_capacity = 30
      my_larger_airport = Airport.new(airport_capacity, weather_double)

      expect(my_larger_airport.capacity).to eq(airport_capacity)
    end

    it 'can be instantiated with a weather checker' do
      weather_checker_double = double("weather_double")
      my_airport = Airport.new(20, weather_checker_double)
      # How can we set rely on one default and not the other?
      # I am using the 20 here because otherwise capacity takes the weather_checker_double
      # Some tests here are now using 2 arguments correctly
      # (we now have a default landed)but i'm not sure how this is working
      # seems like magic ?
      expect(my_airport.weather_checker).to eq(weather_checker_double)
    end
  end

  describe '#land' do
    it 'returns the object it receives' do
      flying_double = double('flying_double', :flying? => true)
      expect(my_airport.land(flying_double)).to eq(flying_double)
    end

    it 'stores the object' do
      flying_double = double('flying_double', :flying? => true)

      my_airport.land(flying_double)

      expect(my_airport.landed).to include(flying_double)
    end

    it 'can store multiple objects' do
      flying_double_1 = double('flying_double', :flying? => true)

      flying_double_2 = double('flying_double', :flying? => true)

      my_airport.land(flying_double_1)
      my_airport.land(flying_double_2)

      expect(my_airport.landed)
          .to include(flying_double_1, flying_double_2)
    end

    it 'can limit the amount of objects landed in an airport' do
      flying_double = double('flying_double', :flying? => true)
      weather_double = double('weather double', :stormy? => false)
      larger_airport_capacity = 50
      my_larger_airport = Airport.new(larger_airport_capacity, weather_double)

      larger_airport_capacity.times do
        my_larger_airport.land(flying_double)
      end
      expect(my_larger_airport.land(flying_double))
          .to eq(Airport::AIRPORT_AT_CAPACITY_MESSAGE)
      expect(my_larger_airport.landed.count).to eq(larger_airport_capacity)
    end

    it 'wont allow an object to land if the weather is stormy' do
      weather_double = double('weather double', :stormy? => true)
      flying_double = double('flying_double')
      my_stormy_airport = Airport.new(20, weather_double)

      expect(my_stormy_airport.land(flying_double))
          .to eq(Airport::WEATHER_STORMY_MESSAGE)
      expect(my_stormy_airport.landed.count).to eq(0)
    end

    it 'will notify it is not possible to land an already landed object' do
      already_landed_double = double('flying_double', :flying? => false)

      expect(my_airport.land(already_landed_double))
          .to eq(Airport::CANT_LAND_NOT_FLYING_PLANE_MESSAGE)
    end
  end

  describe '#take_off' do
    it 'can respond to take_off with an argument' do
      expect(my_airport).to respond_to(:take_off).with(1).argument
    end

    it 'wont try to take off an object if it is not in the airport' do
      not_in_my_airport_double = double('UFO')
      expect(my_airport.take_off(not_in_my_airport_double))
          .to eq(Airport::NOT_AT_AIRPORT_MESSAGE)
    end

    it 'wont try to take off an object if it is stormy' do
      weather_double = double('weather double', :stormy? => true)
      flying_double = double('flying_double', :flying? => false)
      my_airport = Airport.new([flying_double], 20, weather_double)

      expect(my_airport.take_off(flying_double))
          .to eq(Airport::WEATHER_STORMY_MESSAGE)
    end

    it 'will instruct the object to take off' do
      flying_double = double('flying_double', :flying? => false)
      weather_double = double('weather double', :stormy? => false)
      my_airport = Airport.new([flying_double], 20, weather_double)
      expect(flying_double).to receive(:take_off)

      my_airport.take_off(flying_double)
    end

    it 'an object that has taken off will no longer be landed' do
      flying_double = double('flying_double', :flying? => false)
      weather_double = double('weather double', :stormy? => false)
      my_airport = Airport.new([flying_double], 20, weather_double)
      expect(flying_double).to receive(:take_off)

      my_airport.take_off(flying_double)

      expect(my_airport.landed).to_not include(flying_double)
    end

    it 'an object that has not been told to take off will still be landed' do
      departing_double = double('flying_double', :flying? => false)
      staying_double = double('flying_double', :flying? => false)
      weather_double = double('weather double', :stormy? => false)
      my_airport = Airport.new([departing_double, staying_double], 20, weather_double)
      expect(departing_double).to receive(:take_off)

      my_airport.take_off(departing_double)

      expect(my_airport.landed).to include(staying_double)
      expect(my_airport.landed).to_not include(departing_double)
    end

    it 'will raise an error if a landed plane is already flying' do
      already_flying_double = double('flying_double', :flying? => true)
      my_airport.land(already_flying_double)

      expect { my_airport.take_off(already_flying_double) }
          .to raise_error(Airport::UNEXPECTED_FLYING_STATE_ERROR)
    end
  end
end
