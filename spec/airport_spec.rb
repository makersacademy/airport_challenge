require 'airport'

describe Airport do
  let(:my_airport) { Airport.new(20, double('weather double', :is_stormy? => false)) }

  context 'creating an airport' do
    it 'can be instantiated with a capacity' do
      weather_double = double('weather double', :is_stormy? => false)
      airport_capacity = 30
      my_larger_airport = Airport.new(airport_capacity, weather_double)

      expect(my_larger_airport.capacity).to eq(airport_capacity)
    end

    it 'can be instantiated with a weather checker' do
      weather_checker_double = double("weather_double")
      my_airport = Airport.new(20, weather_checker_double)
      # How can we set rely on one default and not the other?
      # I am using the 20 here because otherwise capacity takes the weather_checker_double
      expect(my_airport.weather_checker).to eq(weather_checker_double)
    end
  end

  describe '#land' do
    it 'returns the object it receives' do
      flying_double = double
      expect(my_airport.land(flying_double)).to eq(flying_double)
    end

    it 'stores the flying object' do
      flying_double = double

      my_airport.land(flying_double)

      expect(my_airport.landed).to include(flying_double)
    end

    it 'can store multiple flying objects' do
      flying_double_1 = double
      flying_double_2 = double

      my_airport.land(flying_double_1)
      my_airport.land(flying_double_2)

      expect(my_airport.landed)
          .to include(flying_double_1, flying_double_2)
    end

    it 'can limit the amount of planes landed in an airport' do
      flying_double = double
      weather_double = double('weather double', :is_stormy? => false)
      larger_airport_capacity = 50
      my_larger_airport = Airport.new(larger_airport_capacity, weather_double)

      larger_airport_capacity.times do
        my_larger_airport.land(flying_double)
      end
      expect { my_larger_airport.land(flying_double) }
          .to raise_error Airport::AIRPORT_AT_CAPACITY_ERROR
    end

    it 'wont allow a plane to land if the weather is stormy' do
      weather_double = double('weather double', :is_stormy? => true)
      flying_double = double('flying_double')
      my_stormy_airport = Airport.new(20, weather_double)

      expect { my_stormy_airport.land(flying_double) }
          .to raise_error(Airport::WEATHER_STORMY_ERROR)
    end
  end
end
