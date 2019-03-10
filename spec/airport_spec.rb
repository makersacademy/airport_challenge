require 'airport'

describe Airport do 
  
  before :each do
    @airport_good_weather = Airport.new(double(:weather, status: "☀️"))
    @airport_bad_weather = Airport.new(double(:weather, status: "⛈"))
    @plane = double(:plane)
  end

  describe '.land' do

    # good weather behaviour
    it 'prints a confirmation message if the weather is good' do
      expect { @airport_good_weather.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
    end
    it 'returns the airport object if the weather is good' do
      expect(@airport_good_weather.land @plane).to eq @airport_good_weather
    end
    it 'stores the landed plane if the weather is good' do
      @airport_good_weather.land @plane
      expect(@airport_good_weather.planes).to include @plane
    end

    # bad weather behaviour
    it 'prints a confirmation message if the weather is bad' do
      expect { @airport_bad_weather.land @plane }
        .to output("⛈ Sorry, too dangerous to land. ⛈\n").to_stdout
    end
    it 'returns the airport object if the weather is bad' do
      expect(@airport_bad_weather.land @plane).to eq @airport_bad_weather
    end
    it 'does not store the landed plane if the weather is bad' do
      @airport_bad_weather.land @plane
      expect(@airport_bad_weather.planes).not_to include @plane
    end

    # default capacity behaviour
    it 'prints a message if the airport is full when using default capacity' do
      Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
      expect { @airport_good_weather.land @plane }.to output("Sorry, no more room!\n").to_stdout
    end
    it 'returns the airport object if the airport is full when using default capacity' do
      Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
      expect(@airport_good_weather.land @plane).to eq @airport_good_weather
    end
    it 'does not store the plane if the airport is full when using default capacity' do
      Airport::DEFAULT_CAPACITY.times { @airport_good_weather.land Plane.new }
      @airport_good_weather.land @plane
      expect(@airport_good_weather.planes).not_to include @plane
    end

    # default capacity - 1 behaviour
    it 'prints a message if the airport is one less than full when using default capacity' do
      (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
      expect { @airport_good_weather.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
    end
    it 'returns the airport object if the airport is one less than full when using default capacity' do
      (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
      expect(@airport_good_weather.land @plane).to eq @airport_good_weather
    end
    it 'does store the plane if the airport is one less than full when using default capacity' do
      (Airport::DEFAULT_CAPACITY - 1).times { @airport_good_weather.land Plane.new }
      @airport_good_weather.land @plane
      expect(@airport_good_weather.planes).to include @plane
    end
    
    # custom capacity behaviour
    it 'prints a message if the airport is full when using custom capacity' do
      airport = Airport.new(double(:weather, status: "☀️"), 108)
      108.times { airport.land Plane.new }
      expect { airport.land @plane }.to output("Sorry, no more room!\n").to_stdout
    end

    # custom capacity - 1 behaviour
    it 'prints a message if the airport is one less than full when using custom capacity' do
      airport = Airport.new(double(:weather, status: "☀️"), 108)
      107.times { airport.land Plane.new }
      expect { airport.land @plane }.to output("☀️ Plane landed! ☀️\n").to_stdout
    end
    

  end
  
  describe '.clear_for_takeoff' do

    # good weather behaviour
    it 'prints a confirmation message if the weather is good' do
      expect { @airport_good_weather.clear_for_takeoff @plane }
        .to output("☀️ Up, up and away! ☀️\n").to_stdout
    end
    it 'returns the airport object if the weather is good' do
      @airport_good_weather.land @plane
      expect(@airport_good_weather.clear_for_takeoff @plane).to eq @airport_good_weather
    end
    it 'removes the plane from the airport if the weather is good' do
      @airport_good_weather.land @plane
      @airport_good_weather.clear_for_takeoff @plane
      expect(@airport_good_weather.planes).not_to include @plane
    end

    # bad weather behaviour
    it 'prints an error message if the weather is bad' do
      expect { @airport_bad_weather.clear_for_takeoff(@plane) }
        .to output("⛈ Sorry, all aircraft grounded until further notice. ⛈\n").to_stdout
    end
    it 'returns the airport object if the weather is bad' do
      @airport_bad_weather.land @plane
      expect(@airport_bad_weather.clear_for_takeoff @plane).to eq @airport_bad_weather
    end
    it 'leaves the plane in the airport if the weather is bad' do
      weather = double(:weather)
      allow(weather).to receive(:status).and_return("☀️", "⛈")
      airport = Airport.new(weather)
      airport.land @plane
      airport.clear_for_takeoff @plane
      expect(airport.planes).to include @plane
    end

  end
end
