describe 'User stories => ' do
  let(:airport) { Airport.new(40, weather_reporter) }
  let(:plane) { Plane.new }
  let(:weather_reporter) { WeatherReporter.new }

  context 'when not stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return false
    end
###### User story 

  # As an air traffic controller 
  # So I can get passengers to a destination 
  # I want to instruct a plane to land at an airport.

    it 'instructs a plan to land 🛬 at an airport.' do
      expect { airport.land(plane) }.not_to raise_error
    end

  ###### User story 

  # As an air traffic controller 
  # So I can get passengers on the way to their destination 
  # I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

    it 'instructs a plane to take off 🛫 and send confirmation' do
      airport.land(plane)
      expect { airport.take_off(plane) }.not_to raise_error
    end
  
  ###### User story 

  # As an air traffic controller 
  # To ensure safety 
  # I want to ensure that planes can only take off from airports they are in

  it 'allows only planes to fly from the airports they are in' do
    airport_2 = Airport.new(40, WeatherReporter.new)
    airport_2.land(plane)
    expect { airport.take_off(plane).to raise_error 'Cannot take off: plane is not at this airport'}

  end

  ###### User story 

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when the airport is full

  context 'when the airpot is full' do
    it 'instructs a plane NOT to land ⛔️' do
      40.times do
        airport.land(plane)
      end
      expect { airport.land(plane) }.to raise_error 'Unable to land plane: no empty spaces.'
    end
  end
end


  ###### User story 

  # As the system designer
  # So that the software can be used for many different airports
  # I would like a default airport capacity that can be overridden as appropriate

  it 'shows that the airport has a default capacity' do
    default_airport = Airport.new(WeatherReporter.new)
    Airport::DEFAULT_CAPACITY.times { default_airport.land(plane) }
    expect { default_airport.land(plane) }.to raise_error 'Cannot land a plane'
  end  





  context 'when wheather is stormy' do
    before do
      allow(weather_reporter).to receive(:stormy?).and_return true
    end

  ###### User story 

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent takeoff when weather is stormy

    it 'will not allow planes to take off 🛫 ' do
      expect { airport.take_off(plane) }.to raise_error 'Unable to allow planes to take off: stormy weather.'
    end
  
  ###### User story 

  # As an air traffic controller 
  # To ensure safety 
  # I want to prevent landing when weather is stormy
    
    it 'will not allow lanidng 🛬 ' do
        expect { airport.land(plane) }.to raise_error 'Unable to land plane: stormy weather.'
    end
  end




end





