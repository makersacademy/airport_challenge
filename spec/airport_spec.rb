require 'airport'

describe Airport do 
  
  before :each do
    @airport = Airport.new
    @plane = Plane.new
  end
  
  describe '.land' do
    it 'prints a confirmation message when a plane lands' do
      expect { @airport.land @plane }.to output("Plane landed!\n").to_stdout
    end
    it 'returns the airport object when a plane lands' do
      expect(@airport.land @plane).to eq @airport
    end
    it 'stores the landed plan in an instance variable' do
      @airport.land @plane
      expect(@airport.planes).to include @plane
    end
  end
  
  describe '.clear_for_takeoff' do
    it 'prints a confirmation message when a plane takes off' do
      @airport.land @plane
      expect { @airport.clear_for_takeoff @plane }.to output("Up, up and away!\n").to_stdout
    end
    it 'returns the airport object when a plane takes off' do
      @airport.land @plane
      expect(@airport.clear_for_takeoff @plane).to eq @airport
    end
  end
end
