require './lib/airport.rb'

describe Airport do
  DEFAULT_CAPACITY = Airport::DEFAULT_CAPACITY

  describe '#land' do
    it "prevents landing when #{DEFAULT_CAPACITY} planes in hangar" do
      (DEFAULT_CAPACITY - 1).times { 
        plane = Plane.new
        subject.hangar << plane
      }
      plane = Plane.new
      expect { subject.land(plane) }.to raise_error 'Hangar is full!' 
    end
    it 'prevents landing if plane already landed' do
      plane = subject.hangar[0]
      expect { subject.land(plane) }.to raise_error 'Plane already landed!'
    end
    it 'prevents landing if weather is stormy' do
      sunny_weather = instance_double("WeatherForecaster", :current => "Sunny")
      sunny_airport = Airport.new(weather: sunny_weather)
      stormy_weather = instance_double("WeatherForecaster", :current => "Stormy")
      stormy_airport = Airport.new(weather: stormy_weather)
      
      plane = sunny_airport.hangar[0]
      sunny_airport.take_off(plane)
      expect { stormy_airport.land(plane) }.to raise_error 'Weather is stormy. Unable to land!'
    end
  end
  describe '#take_off' do
    it 'removes the plane from the airport hangar' do
      sunny_weather = instance_double("WeatherForecaster", :current => "Sunny")
      airport = Airport.new(weather: sunny_weather)
      plane = airport.hangar[0]
      airport.take_off(plane)
      expect(airport.hangar.include?(plane)).to eq(false)
    end
    it 'raises an error if plane not in airport' do
      plane = Plane.new
      expect { subject.take_off(plane) }.to raise_error 'Plane not found in airport!'
    end
    it 'raises an error when weather is "Stormy"' do 
      stormy_weather = instance_double("WeatherForecaster", :current => "Stormy")
      airport = Airport.new(weather: stormy_weather)
      plane = airport.hangar[0]
      expect { airport.take_off(plane) }.to raise_error 'Weather is stormy. Unable to take-off!'
    end
  end
  describe '#hangar' do
    it 'stores a plane in the airport hangar' do
      plane = subject.hangar[0]
      expect(subject.hangar.include?(plane)).to eq(true)
    end
  end
  describe '#capacity' do
    it "has a default capacity of #{DEFAULT_CAPACITY}" do
      expect(subject.capacity).to eq(50)
    end
    it 'can override the default capacity' do
      airport = Airport.new(capacity: 100)
      expect(airport.capacity).to eq(100)
    end
  end
  describe '#weather' do
    it 'has a default weather of either sunny or stormy' do
      weathers = ["Stormy", "Sunny"]
      expect(weathers.include?(subject.weather.current)).to eq(true)
    end
  end
end
