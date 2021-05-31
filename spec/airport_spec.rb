require './lib/airport.rb'
require './lib/plane.rb'
require './lib/weather.rb'

describe Airport do
  let(:weather) { double :weather }

# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport
  
  describe '#land(plane)' do
    it "instruct a plane to land at an airport" do
      allow(weather).to receive(:weather_status).and_return "good"
      airport = Airport.new(weather, 10)
      plane = Plane.new
      expect(airport.land(plane)).to eq 1
    end
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport
  
  describe '#take_off(plane)' do
    it "confirms that airplane is no longer in the airport" do
      allow(weather).to receive(:weather_status).and_return "good"
      airport = Airport.new(weather, 10)
      plane = Plane.new
      airport.land(plane)
      expect(airport.take_off(plane)).to eq 0
    end
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

  it "raise an error if airport is full" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather, 10)
    10.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is Full!"
  end

# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  it "override the default airport capacity as appropriate" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather, 50)
    50.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error "Airport is Full!"
  end

# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

  it 'takeoff: raise an error when weather is stormy' do
    allow(weather).to receive(:weather_status).and_return "stormy"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    expect { airport.take_off(plane) }.to raise_error "Stormy Weather Detected - All Flights are Grounded!"
  end

# As an air traffic controller 
# To ensure safety 
# I want to prevent landing when weather is stormy 

  it 'landing: raise an error when weather is stormy' do
    allow(weather).to receive(:weather_status).and_return "stormy"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error "Stormy Weather Detected - No Flights may Land!"
  end
end
