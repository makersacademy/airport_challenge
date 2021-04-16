describe 'User Stories' do

  let(:airport) { Airport.new(weather_forecast, 20) }
  let(:plane) { Plane.new }
  let(:weather_forecast) { WeatherForecast.new }

  context 'when weather is not stormy' do
    before do
      allow(weather_forecast).to receive(:stormy?).and_return false
    end
    # I want to instruct a plane to land at an airport
    it 'instruct a plane to land at an airport' do
      expect {airport.land(plane)}.not_to raise_error
    end
  
    # I want to instruct a plane to take off from an airport
    it 'instruct a plane to take off from an airport' do
      airport.land(plane)
      expect {airport.take_off(plane)}.not_to raise_error
    end

    # I want to confirm that a plane that's taken off is no longer in the airport
    it 'planes take off from the airport they are at' do
      airport_2 = Airport.new(weather_forecast, 20)
      airport_2.land(plane)
      expect { airport.take_off(plane) }.to raise_error "Plane taken off - no longer in the airport"
    end
    
    # I would like a default airport capacity that can be overridden as appropriate

    it 'airports have a default capacity' do
      default_airport = Airport.new(weather_forecast)
      Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
      expect { default_airport.land(plane) }.to raise_error "Cannot land plane - airport full"
    end
  
    # I want to prevent landing when the airport is full 
    context 'when airport is full' do
      it 'does not allow planes to land' do
        20.times {airport.land(plane)}
        expect { airport.land(plane) }.to raise_error "Cannot land plane - airport full"
      end
    end
  end

  # I want to prevent landing or taking off when weather is stormy 
  context 'when weather is stormy' do
    before do
      allow(weather_forecast).to receive(:stormy?).and_return true
    end
    it 'does not allow planes to land' do
      expect { airport.land(plane) }.to raise_error "Cannot land plane - stormy weather"
    end
    it 'does not allow planes to take off' do
      expect { airport.take_off(plane) }.to raise_error "Cannot take off plane - stormy weather"
    end
  end

end