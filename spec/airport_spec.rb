# As an air traffic controller
# So I can get passengers to a destination
# I want to instruct a plane to land at an airport

require 'airport'
require 'plane'
require 'weather'

describe Airport do
  let(:weather) {
    double(:weather)
  }

  it "instruct a plane to land at an airport" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    expect(airport.land(plane)).to eq 1
  end

# As an air traffic controller
# So I can get passengers on the way to their destination
# I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

  it "take_off method to return updated number of airplanes" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    airport.land(plane)
    expect(airport.take_off(plane)).to eq 0
  end

# As an air traffic controller
# To ensure safety
# I want to prevent landing when the airport is full

  it "it will throw an error if airport at full capacity" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather, 10)
    10.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error("Airport at full capacity")
  end


# As the system designer
# So that the software can be used for many different airports
# I would like a default airport capacity that can be overridden as appropriate

  it "it will throw an error if airport at default capacity" do
    allow(weather).to receive(:weather_status).and_return "good"
    airport = Airport.new(weather)
    Airport::DEFAULT_CAPACITY.times { airport.land(Plane.new) }
    expect { airport.land(Plane.new) }.to raise_error("Airport at full capacity")
  end


# As an air traffic controller
# To ensure safety
# I want to prevent takeoff when weather is stormy

  it 'throw an error at takeoff when wheater is stormy' do
    allow(weather).to receive(:weather_status).and_return "stormy"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    expect { airport.take_off(plane) }.to raise_error("The storm is preventing us to takeoff")
  end


  it 'throw an error at landing when wheater is stormy' do
    allow(weather).to receive(:weather_status).and_return "stormy"
    airport = Airport.new(weather, 10)
    plane = Plane.new
    expect { airport.land(plane) }.to raise_error("The storm is preventing us to land")
  end
end
