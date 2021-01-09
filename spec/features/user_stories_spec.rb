describe 'User Stories' do

  let(:airport) { Airport.new(20, weather_forecast) }
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
      expect {airport.take_off(plane)}.not_to raise_error
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