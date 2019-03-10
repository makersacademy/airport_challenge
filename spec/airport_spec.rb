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
      expect { @airport_good_weather.land @plane }.to output("Plane landed!\n").to_stdout
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
      @airport_bad_weather.land @plane
      @airport_bad_weather.clear_for_takeoff @plane
      expect(@airport_bad_weather.planes).to include @plane
    end

  end
end
