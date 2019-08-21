require 'airport'

RSpec.describe Airport do

  describe '#land' do 

    it 'raise an error whether the weather is stormy' do
      stubWeather = double(:status => :stormy)
      allow(stubWeather).to receive(:status).and_return(:stormy)
      airport = Airport.new(stubWeather)
      airplane = Airplane.new
      expect { airport.land(*airplane) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error whether the airport is full' do
      stubWeather = object_double(Weather.new, :status => :sunny)
      allow(stubWeather).to receive(:status) {:sunny}
      airport = Airport.new(stubWeather, 2)
      airplane = Airplane.new
      airport.land(Airplane.new, Airplane.new)
      expect { airport.land(*airplane) }.to raise_error 'The airport is full'
    end

    it 'raise an error whether the airplane has already landed' do
      stubWeather = object_double(Weather.new, :status => :sunny)
      allow(stubWeather).to receive(:status) {:sunny}
      airport = Airport.new(stubWeather)
      airplane = Airplane.new
      p airport.land(airplane)
      expect { p airport.land(airplane) }.to raise_error 'The airplane has already landed'
    end

    it 'instruct an airplane to land at the airport' do
      stubWeather = object_double(Weather.new, :status => :sunny)
      allow(stubWeather).to receive(:status) {:sunny}
      airplane = Airplane.new
      airport = Airport.new(stubWeather)
      expect(airport.land(airplane)).to eq([airplane])
    end
  end

  describe '#take_off' do
    
    it 'raise an error if the weather is stormy' do
      stubWeather = double(:status => :stormy)
      allow(stubWeather).to receive(:status).and_return(:stormy)
      airport = Airport.new(stubWeather)
      airplane = Airplane.new
      expect { airport.take_off(airplane) }.to raise_error 'The weather is stormy'
    end

    it 'raise an error if the airplane has already took off or is not in the hangar' do
      stubWeather = object_double(Weather.new, :status => :sunny)
      allow(stubWeather).to receive(:status) {:sunny}
      airport = Airport.new(stubWeather)
      airplane = Airplane.new
      expect { airport.take_off(airplane) }.to raise_error 'The airplane is not in the airport'
    end

    it 'instruct a plane to take off' do 
      stubWeather = object_double(Weather.new, :status => :sunny)
      allow(stubWeather).to receive(:status) {:sunny}
      airport = Airport.new(stubWeather)
      airplane = Airplane.new
      airport.land(airplane)
      expect(airport.take_off(airplane)).to eq "The airplane #{airplane} has taken off"
    end
  end

end
