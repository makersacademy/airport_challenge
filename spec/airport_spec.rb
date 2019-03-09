require 'airport'

describe Airport do 
  
  before :each do
    @airport = Airport.new(double(:weather))
    @plane = double(:plane)
  end

  describe '.land' do
    it 'prints a confirmation message when a plane lands' do
      expect { @airport.land @plane }.to output("Plane landed!\n").to_stdout
    end
    it 'returns the airport object when a plane lands' do
      expect(@airport.land @plane).to eq @airport
    end
    it 'stores the landed plane in an instance variable' do
      @airport.land @plane
      expect(@airport.planes).to include @plane
    end
  end
  
  describe '.clear_for_takeoff' do

    # good weather behaviour
    it 'prints a confirmation message if the weather is good' do
      airport = Airport.new(double(:weather, status: "☀️"))
      expect { airport.clear_for_takeoff @plane }.to output("Up, up and away!\n").to_stdout
    end
    it 'returns the airport object if the weather is good' do
      airport = Airport.new(double(:weather, status: "☀️"))
      airport.land @plane
      expect(airport.clear_for_takeoff @plane).to eq airport
    end
    it 'removes the plane from the airport if the weather is good' do
      airport = Airport.new(double(:weather, status: "☀️"))
      airport.land @plane
      airport.clear_for_takeoff @plane
      expect(airport.planes).not_to include @plane
    end

    # bad weather behaviour
    it 'prints an error message if the weather is bad' do
      weather = double(:weather, status: "⛈")
      airport = Airport.new(weather)
      expect { airport.clear_for_takeoff(@plane) }.to output("⛈ Sorry, all aircraft grounded until further notice. ⛈\n").to_stdout
    end
    it 'returns the airport object if the weather is bad' do
      airport = Airport.new(double(:weather, status: "⛈"))
      airport.land @plane
      expect(airport.clear_for_takeoff @plane).to eq airport
    end
    it 'leaves the plane in the airport if the weather is bad' do
      airport = Airport.new(double(:weather, status: "⛈️"))
      airport.land @plane
      airport.clear_for_takeoff @plane
      expect(airport.planes).to include @plane
    end

  end
end
