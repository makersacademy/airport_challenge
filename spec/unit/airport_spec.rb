require './lib/airport.rb'

describe Airport do
  describe 'Given weather conditions are sunny, ' do
    before(:each) do
      @weather_double = double(:weather, stormy?: false)
      @airport = Airport.new(weather: @weather_double)
      @plane_double = double(:plane, land: "", take_off: "")
    end

    describe 'When the airport has capacity and is instructed to land plane, ' do
      before(:each) do
        @airport.land(@plane_double)
      end

      it 'should instruct that plane to land' do
        expect(@plane_double).to have_received(:land)
      end

      it 'should add plane to airport once landed' do
        expect(@airport.planes).to eq([@plane_double])
      end
    end

    describe 'When the airport is full up to the default capacity, ' do
      it 'should prevent planes from landing' do
        Airport::DEFAULT_CAPACITY.times { @airport.land(@plane_double) }
    
        expect { @airport.land(@plane_double) }.to raise_error('Plane cannot land as airport is full')
      end
    end

    describe 'When the airport is full up to the user-set capacity ' do
      it 'should prevent planes from landing' do
        capacity = 15
        airport = Airport.new(capacity: capacity, weather: @weather_double)
        capacity.times { airport.land(@plane_double) }
    
        expect { airport.land(@plane_double) }.to raise_error('Plane cannot land as airport is full')
      end
    end

    describe 'When airport is instructed to take off plane that is in airport, ' do
      before(:each) do
        @airport.land(@plane_double)
        @airport.take_off(@plane_double)
      end

      it 'should instruct plane to take off' do
        expect(@plane_double).to have_received(:take_off)
      end

      it 'should remove plane after take off' do
        expect(@airport.planes).to eq([])
      end
    end

    describe 'When airport is instructed to take off plane that is NOT in airpot' do
      it 'should raise exception' do
        expect { @airport.take_off(@plane_double) }.to raise_error('Plane is not in this airport')
      end
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
      expect { @airport.take_off(@plane_double) }.to raise_error('Cannot take off due to stormy weather')
    end

    it 'should prevent landing' do
      expect { @airport.land(@plane_double) }.to raise_error('Cannot land due to stormy weather')
    end
  end
end
