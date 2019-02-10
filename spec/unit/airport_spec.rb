require './lib/airport.rb'

describe Airport do
  describe 'Given weather conditions are sunny' do
    before(:each) do
      @weather_double = double(:weather, stormy?: false)
      @airport = Airport.new(weather: @weather_double)
      @plane_double = double(:plane, land: "", take_off: "")
    end

    it 'should instruct planes to land' do
      @airport.land(@plane_double)
  
      expect(@plane_double).to have_received(:land)
    end

    it 'should add plane to airport once landed' do
      @airport.land(@plane_double)
  
      expect(@airport.planes).to eq([@plane_double])
    end

    it 'should prevent planes from landing when airport is full' do
      Airport::DEFAULT_CAPACITY.times { @airport.land(@plane_double) }
  
      expect { @airport.land(@plane_double) }.to raise_error('Plane cannot land as airport is full')
    end

    it 'should optionally set airport capacity when airport created' do
      capacity = 15
      airport = Airport.new(capacity: capacity, weather: @weather_double)
      capacity.times { airport.land(@plane_double) }
  
      expect { airport.land(@plane_double) }.to raise_error('Plane cannot land as airport is full')
    end

    it 'should instruct planes to take off' do
      @airport.land(@plane_double)
      @airport.take_off_plane(@plane_double)
  
      expect(@plane_double).to have_received(:take_off)
    end

    it 'should remove planes when they take off' do
      @airport.land(@plane_double)
      @airport.take_off_plane(@plane_double)
  
      expect(@airport.planes).to eq([])
    end

    it 'should raise exception if attempts to take off plane that is not in the airport' do
      expect { @airport.take_off_plane(@plane_double) }.to raise_error('Plane is not in this airport')
    end
  end

  describe 'Given weather conditions are stormy, ' do
    before(:each) do
      @weather_double = double(:weather, stormy?: true)
      @airport = Airport.new(weather: @weather_double)

      @plane_double = double(:plane, land: "")
    end

    it 'should prevent takeoff' do
      allow(@weather_double).to receive(:stormy?).and_return(false)
      @airport.land(@plane_double)

      allow(@weather_double).to receive(:stormy?).and_return(true)
      expect { @airport.take_off_plane(@plane_double) }.to raise_error('Cannot take off due to stormy weather')
    end

    it 'should prevent landing' do
      expect { @airport.land(@plane_double) }.to raise_error('Cannot land due to stormy weather')
    end
  end
end
